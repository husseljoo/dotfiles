local wezterm = require 'wezterm'

local mux = wezterm.mux
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local config = wezterm.config_builder()
config.color_scheme = 'AdventureTime'
config.window_decorations = 'RESIZE'
config.adjust_window_size_when_changing_font_size = false

-- config.window_background_opacity = 0.7
config.window_background_opacity = 1.0

-- Leader is the same as my tmux prefix
config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }
config.default_prog = { 'pwsh.exe' }

config.keys = {
  -- splitting
  {
    key    = "c",
    mods   = "LEADER",
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key    = "-",
    mods   = "LEADER",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    key    = "=",
    mods   = "LEADER",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    key = 'm',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState
  },
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode
  },
  {
      key = 'x',
      mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
      key = 'X',
      mods = 'LEADER',
      action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'Space',
    mods = 'LEADER',
    action = wezterm.action.ActivateLastTab,
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = ':',
    mods = 'LEADER',
    action = wezterm.action.ShowDebugOverlay
  },
  {
    key = '+',
    mods = 'CTRL',
    action = wezterm.action.IncreaseFontSize
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.DecreaseFontSize
  },
  { key = 'n', mods = 'CTRL', action = wezterm.action.RotatePanes 'Clockwise' },
  { key = 'O', mods = 'LEADER', action = wezterm.action.RotatePanes 'Clockwise' },
  { key = 'h', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Left', 5 },},
  { key = 'j', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Down', 5 },},
  { key = 'k', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
  { key = 'l', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Right', 5 }, },
  { key = 'o', mods = 'LEADER', action = wezterm.action{ActivatePaneDirection="Next"}},
  { key = 'o', mods = 'CTRL', action = wezterm.action{ActivatePaneDirection="Next"}},
}

for i = 1, 8 do
  -- Ctrl+Space + number to activate that window
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateWindow(i - 1),
  })
end

return config
