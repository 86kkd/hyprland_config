#!/usr/bin/env bash
set -euo pipefail

# wf-recorder based screen recorder with toggle start/stop
# - First press: arm for 3s, then start
# - Press again during 3s: cancel (no new thread)
# - Press while recording: stop
#
# Deps: wf-recorder, (optional) slurp, pactl, hyprctl, jq (optional for focused monitor)

OUT_DIR="$HOME/Videos/Recordings"
STATE_DIR="/tmp/wf-recorder.state"          # 统一放状态
PID_FILE="$STATE_DIR/pid"
LOG_FILE="$STATE_DIR/log"
ARM_FILE="$STATE_DIR/arming"                # ← 新增：表示“等待启动”
LOCK_DIR="/tmp/wf-recorder.lockdir"         # ← 新增：用 mkdir 做互斥锁
STOP_REQ_FILE="$STATE_DIR/stop_req"
mkdir -p "$STATE_DIR"

notify_msg() {
  local level="$1"; shift || true
  local ms_override=""   # 可选等待时间
  # 如果下一个参数是纯数字，就当成等待时间
  if [[ "${1:-}" =~ ^[0-9]+$ ]]; then
    ms_override="$1"
    shift
  fi
  local body="$*"

  # 默认值
  local color="rgb(200,200,200)"
  local ms=2500

  case "$level" in
    info)  color="rgb(170,255,170)"; ms=1000;;
    warn)  color="rgb(255,230,150)"; ms=3200;;
    error) color="rgb(255,120,120)"; ms=4200;;
  esac

  # 如果传了等待时间，覆盖默认值
  [ -n "$ms_override" ] && ms="$ms_override"
  hyprctl -q notify -1 "$ms" "$color" "Screen Recording: " "$body" >/dev/null 2>&1 || true
}

print_usage() {
  echo "Usage: $0 [-r] [-s|-m] [-o OUTPUT]" 1>&2
}

command -v wf-recorder >/dev/null 2>&1 || { echo "wf-recorder 未安装" 1>&2; exit 1; }

REGION=false
AUDIO_MODE="none"   # none | system | mic
OUTPUT_NAME=""

while (( "$#" )); do
  case "$1" in
    -r|--region) REGION=true; shift;;
    -s|--system) AUDIO_MODE="system"; shift;;
    -m|--mic)    [ "$AUDIO_MODE" = "system" ] || AUDIO_MODE="mic"; shift;;
    -o|--output) OUTPUT_NAME="${2-}"; [ -z "$OUTPUT_NAME" ] && { echo "--output 需要名称" 1>&2; exit 1; }; shift 2;;
    -h|--help)   print_usage; exit 0;;
    *) echo "未知参数: $1" 1>&2; print_usage; exit 1;;
  esac
done

# -------------------- 原子锁（无依赖 flock） --------------------
acquire_lock() {
  if mkdir "$LOCK_DIR" 2>/dev/null; then
    trap 'rm -rf "$LOCK_DIR"' EXIT
    return 0
  else
    return 1
  fi
}

if ! acquire_lock; then
  # <<<<<< 修改开始：即使拿不到锁，也尝试直接处理当前状态 >>>>>>
  # 1) 倒计时中：直接取消
  if [ -f "$ARM_FILE" ]; then
    rm -f "$ARM_FILE" "$STOP_REQ_FILE" 2>/dev/null || true
    notify_msg info 1000 "⛔ Stop success"
    exit 0
  fi

  # 2) 正在录制：直接停止
  if [ -f "$PID_FILE" ]; then
    PID_CONTENT="$(cat "$PID_FILE" 2>/dev/null || true)"
    if [ -n "${PID_CONTENT:-}" ] && kill -0 "$PID_CONTENT" 2>/dev/null; then
      kill -INT "$PID_CONTENT" 2>/dev/null || true
      rm -f "$PID_FILE" "$STOP_REQ_FILE" 2>/dev/null || true
      notify_msg info "🔴 Stopped"
      exit 0
    fi
  fi

  # 3) 兜底：既不在倒计时也不在录制 → 不启动，避免竞态
  notify_msg info 800 "👨‍💻 Busy (ignored)"
  exit 0
  # <<<<<< 修改结束 >>>>>>
fi

# -------------------- 状态判定：先处理“停止/取消” --------------------
is_running=false
if [ -f "$PID_FILE" ]; then
  PID_CONTENT="$(cat "$PID_FILE" 2>/dev/null || true)"
  if [ -n "${PID_CONTENT:-}" ] && kill -0 "$PID_CONTENT" 2>/dev/null; then
    is_running=true
  else
    rm -f "$PID_FILE"
  fi
fi

# 1) 如果正在录制：这次就是“停止”
if $is_running; then
  kill -INT "$PID_CONTENT" 2>/dev/null || true
  rm -f "$PID_FILE" "$STOP_REQ_FILE" "$ARM_FILE" 2>/dev/null || true
  notify_msg info "🔴 Stopped"
  exit 0
fi

# 2) 如果处于倒计时阶段：这次就是“取消启动”
if [ -f "$ARM_FILE" ]; then
  rm -f "$ARM_FILE" "$STOP_REQ_FILE" 2>/dev/null || true
  notify_msg info 1000 "⛔ Stop success"
  exit 0
fi

# 3) 既不在录制，也不在倒计时：这次就是“开始倒计时”
mkdir -p "$OUT_DIR"
OUTPUT_FILE="$OUT_DIR/rec-$(date +%Y%m%d-%H%M%S).mkv"
ARGS=( -f "$OUTPUT_FILE" )

if $REGION; then
  command -v slurp >/dev/null 2>&1 || { echo "未找到 slurp，无法区域录制" 1>&2; exit 1; }
  GEOM=$(slurp)
  [ -z "$GEOM" ] && { echo "取消选择区域" 1>&2; exit 1; }
  ARGS+=( -g "$GEOM" )
else
  if [ -z "$OUTPUT_NAME" ]; then
    if command -v jq >/dev/null 2>&1; then
      OUTPUT_NAME=$(hyprctl -j monitors 2>/dev/null | jq -r '.[] | select(.focused==true) | .name' | head -n1 || true)
    fi
    [ -n "$OUTPUT_NAME" ] || OUTPUT_NAME=$(hyprctl monitors 2>/dev/null | awk '/Monitor /{name=$2} /focused: yes/{print name}' | head -n1)
    [ -n "$OUTPUT_NAME" ] || OUTPUT_NAME=$(hyprctl monitors 2>/dev/null | awk '/Monitor /{print $2; exit}')
  fi
  if [ -z "$OUTPUT_NAME" ]; then
    notify_msg error "Failed: cannot detect output"
    exit 1
  fi
  ARGS+=( -o "$OUTPUT_NAME" )
fi

if [ "$AUDIO_MODE" != "none" ]; then
  command -v pactl >/dev/null 2>&1 || { echo "未找到 pactl，无法选择音频源" 1>&2; exit 1; }
  case "$AUDIO_MODE" in
    system)
      DEFAULT_SINK=$(pactl get-default-sink)
      [ -n "${DEFAULT_SINK:-}" ] || { echo "无法获取默认输出 (sink)" 1>&2; exit 1; }
      AUDIO_SOURCE="${DEFAULT_SINK}.monitor"
      ;;
    mic)
      AUDIO_SOURCE=$(pactl get-default-source)
      [ -n "${AUDIO_SOURCE:-}" ] || { echo "无法获取默认输入 (source)" 1>&2; exit 1; }
      ;;
  esac
  ARGS+=( "--audio=$AUDIO_SOURCE" )
fi

# -------------------- 倒计时（arming） --------------------
: > "$ARM_FILE"                                # ← 标记“正在等待启动”
notify_msg info 3000 "🟢 Starting in 3s..."
notify_msg info 3000 "📂 → $OUTPUT_FILE (Output: ${OUTPUT_NAME:-region})"
for i in 3 2 1; do
  sleep 1
  # 如果期间再次触发脚本，会走到前面的“取消启动”分支并删除 ARM_FILE
  if [ ! -f "$ARM_FILE" ]; then
    exit 0
  fi
done

# 如果有外部 stop 请求，也取消
if [ -f "$STOP_REQ_FILE" ]; then
  rm -f "$STOP_REQ_FILE" "$ARM_FILE" 2>/dev/null || true
  notify_msg warn "Start cancelled by queued stop"
  exit 0
fi

# -------------------- 启动录制 --------------------
: > "$LOG_FILE"
wf-recorder "${ARGS[@]}" >> "$LOG_FILE" 2>&1 &
WF_PID=$!
echo "$WF_PID" > "$PID_FILE"
rm -f "$ARM_FILE" 2>/dev/null || true         # ← 启动后清除 arming

notify_msg info 1000 "📹 Recording now ⏩⏩⏩"


# 快速存活检查
sleep 0.3
if ! kill -0 "$WF_PID" 2>/dev/null; then
  notify_msg error "❌ Failed to start. See $LOG_FILE"
  rm -f "$PID_FILE"
  exit 1
fi

# 如果启动后马上有 stop 请求，立即停止
if [ -f "$STOP_REQ_FILE" ]; then
  rm -f "$STOP_REQ_FILE" 2>/dev/null || true
  kill -INT "$WF_PID" 2>/dev/null || true
  notify_msg info "🔴 Stopped (queued)"
fi

wait "$WF_PID" || true
[ -f "$PID_FILE" ] && rm -f "$PID_FILE"
rm -f "$ARM_FILE" "$STOP_REQ_FILE" 2>/dev/null || true
