# Hyprland 配置

Hyprland **0.57+** 只加载 Lua 配置。入口是 [`hyprland.lua`](hyprland.lua)，模块在 [`lua/`](lua/)。

旧的 `hyprland.conf` / `configs/` / `UserConfigs/` 已移除，不要再加回 hyprlang 格式的 compositor 配置。

## 目录

| 路径 | 作用 |
| --- | --- |
| `hyprland.lua` | 入口：加载插件与各 Lua 模块 |
| `lua/` | 实际配置（按键、规则、显示器、动画等） |
| `plugins/` | 插件（如 `hyprscroller.so`） |
| `scripts/` / `UserScripts/` | 辅助脚本 |
| `hyprlock*.conf` / `hypridle.conf` | 锁屏与空闲（仍用 hyprlang） |
| `wallust/` | 主题色；`decorations.lua` 会读入 |
| `application-style.conf` | hypr* Qt 应用样式 |
| `Monitor_Profiles/` | 显示器配置文件（脚本用） |
| `backups/` | 本地备份（已 gitignore） |

模块说明见 [`lua/README.md`](lua/README.md)。个人覆盖优先改 `lua/user_*.lua`。

## 常用操作

```bash
hyprctl reload                 # 重载 Lua 配置
hyprctl deprecated-config      # 查看废弃项
hyprctl systeminfo | grep configProvider  # 应为 lua
```

改完 `hyprland.lua` 或模块后一般 `hyprctl reload` 即可；若从无 conf 迁到 Lua，需要完整重启一次会话。
