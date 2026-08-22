#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Compatibility helpers for wallpaper backends.
# Supports legacy `swww` and renamed Arch package binaries `awww`.

wallpaper_backend_detect() {
  if command -v swww >/dev/null 2>&1 && command -v swww-daemon >/dev/null 2>&1; then
    WALLPAPER_BACKEND="swww"
    WALLPAPER_BACKEND_BIN="swww"
    WALLPAPER_DAEMON_BIN="swww-daemon"
    WALLPAPER_CACHE_ROOT="${XDG_CACHE_HOME:-$HOME/.cache}/swww"
    return 0
  fi

  if command -v awww >/dev/null 2>&1 && command -v awww-daemon >/dev/null 2>&1; then
    WALLPAPER_BACKEND="awww"
    WALLPAPER_BACKEND_BIN="awww"
    WALLPAPER_DAEMON_BIN="awww-daemon"
    WALLPAPER_CACHE_ROOT="${XDG_CACHE_HOME:-$HOME/.cache}/awww"
    return 0
  fi

  WALLPAPER_BACKEND=""
  WALLPAPER_BACKEND_BIN=""
  WALLPAPER_DAEMON_BIN=""
  WALLPAPER_CACHE_ROOT=""
  return 1
}

wallpaper_backend_require() {
  local message="${1:-Neither swww nor awww is installed}"

  if wallpaper_backend_detect; then
    return 0
  fi

  if command -v notify-send >/dev/null 2>&1; then
    notify-send -i "$HOME/.config/swaync/images/error.png" "Wallpaper backend missing" "$message"
  else
    printf '%s\n' "$message" >&2
  fi

  return 1
}

wallpaper_backend_name() {
  wallpaper_backend_require || return 1
  printf '%s\n' "$WALLPAPER_BACKEND"
}

wallpaper_daemon_name() {
  wallpaper_backend_require || return 1
  printf '%s\n' "$WALLPAPER_DAEMON_BIN"
}

wallpaper_cache_root() {
  wallpaper_backend_require || return 1
  printf '%s\n' "$WALLPAPER_CACHE_ROOT"
}

wallpaper_query() {
  wallpaper_backend_require || return 1
  "$WALLPAPER_BACKEND_BIN" query "$@"
}

wallpaper_query_ok() {
  wallpaper_query "$@" >/dev/null 2>&1
}

wallpaper_start_daemon() {
  wallpaper_backend_require || return 1
  "$WALLPAPER_DAEMON_BIN" "$@"
}

wallpaper_ensure_daemon() {
  wallpaper_backend_require || return 1

  if ! pgrep -x "$WALLPAPER_DAEMON_BIN" >/dev/null 2>&1; then
    wallpaper_start_daemon "$@" &
    sleep 0.2
  fi
}

wallpaper_img() {
  wallpaper_backend_require || return 1
  "$WALLPAPER_BACKEND_BIN" img "$@"
}

wallpaper_kill() {
  wallpaper_backend_require || return 1
  "$WALLPAPER_BACKEND_BIN" kill "$@"
}

wallpaper_current_image() {
  local monitor="${1:-}"

  wallpaper_backend_require || return 1

  case "$WALLPAPER_BACKEND" in
    swww)
      wallpaper_query | awk -v mon="$monitor" '
        /^Monitor/ {
          cur = $2
          gsub(":", "", cur)
        }
        /image:/ && (mon == "" || cur == mon) {
          sub(/^.*image: /, "")
          print
          exit
        }
      '
      ;;
    awww)
      wallpaper_query -j | jq -r --arg mon "$monitor" '
        [
          to_entries[]
          | .value[]
          | select(($mon == "") or (.name == $mon))
          | .displaying.image // empty
        ][0] // empty
      '
      ;;
    *)
      return 1
      ;;
  esac
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  set -euo pipefail

  cmd="${1:-}"
  if [[ $# -gt 0 ]]; then
    shift
  fi

  case "$cmd" in
    backend)
      wallpaper_backend_name
      ;;
    daemon-name)
      wallpaper_daemon_name
      ;;
    cache-root)
      wallpaper_cache_root
      ;;
    has-backend)
      wallpaper_backend_require
      ;;
    query)
      wallpaper_query "$@"
      ;;
    current-image)
      wallpaper_current_image "${1:-}"
      ;;
    start-daemon)
      wallpaper_start_daemon "$@"
      ;;
    img)
      wallpaper_img "$@"
      ;;
    kill)
      wallpaper_kill "$@"
      ;;
    *)
      printf 'Usage: %s {backend|daemon-name|cache-root|has-backend|query|current-image|start-daemon|img|kill}\n' "$0" >&2
      exit 2
      ;;
  esac
fi
