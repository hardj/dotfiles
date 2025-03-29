local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

local act = wezterm.action

config.font_size=19

config.window_decorations = "RESIZE"

config.keys = {
    {
        key="Space", 
        mods="SHIFT", 
        action=wezterm.action{SendString="\x1b[SS"}
    },  -- Пример для действия с Shift+Space
    {
        key = "-",
        mods = "LEADER",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
   },
   {
        key = "|",
        mods = "LEADER",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
   },
   {
        key = "Enter",
        mods = "CMD",
        action = wezterm.action.ToggleFullScreen,
   },
   {
       key = 'c',
       mods = 'LEADER',
       action = wezterm.action.SpawnTab 'CurrentPaneDomain',
   },
   {key="h", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
   {key="р", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
   {key="j", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
   {key="о", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
   {key="k", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
   {key="л", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
   {key="l", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},
   {key="д", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},
   {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action_callback(function(win, pane)
      local tab, window = pane:move_to_new_tab()
      tab:activate()
    end),
   },
   {
      key = ',',
      mods = 'LEADER',
      action = wezterm.action.PromptInputLine {
        description = 'Enter new name for tab',
        action = wezterm.action_callback(
          function(window, pane, line)
            if line then
              window:active_tab():set_title(line)
            end
          end
        ),
      },
   },
   {
      key = 'm',
      mods = 'LEADER',
      action = wezterm.action.TogglePaneZoomState,
   },
}


config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.90
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = true


return config
