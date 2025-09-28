local wezterm = require 'wezterm'

local function move_pane(key, direction)
  return {
    key = key,
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

local function resize_pane(key, direction)
  return {
    key = key,
    action = wezterm.action.AdjustPaneSize { direction, 3 }
  }
end

return {
  font = wezterm.font("Consolas Nerd Font"),
  font_size = 16.0,

  color_scheme = "nord",
  window_background_opacity = 0.9,
  macos_window_background_blur = 30,

  window_decorations = 'RESIZE',
  window_frame = {
    font = wezterm.font({ family = 'BlexMono Nerd Font Mono', weight = 'Bold' }),
    font_size = 16
  },

  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },

  keys = {
     {
       key = ',',
       mods = 'SUPER',
       action = wezterm.action.SpawnCommandInNewTab {
         cwd = wezterm.home_dir,
         args = { 'nvim', wezterm.config_file }
       }
     },
     {
       key = 'LeftArrow',
       mods = 'OPT',
       action = wezterm.action.SendString '\x1bb',
      },
      {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bf',
      },
      {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
      },
      {
        key = '|',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
      },
      move_pane('j', 'Down'),
      move_pane('k', 'Up'),
      move_pane('h', 'Left'),
      move_pane('l', 'Right'),
      {
        key = 'r',
        mods = 'LEADER',
        action = wezterm.action.ActivateKeyTable {
          name = 'resize_panes',
          one_shot = false,
          timeout_milliseconds = 1000,
        }
      },
  },

  key_tables = {
    resize_panes = {
    resize_pane('j', 'Down'),
    resize_pane('k', 'Up'),
    resize_pane('h', 'Left'),
    resize_pane('l', 'Right'),
    },
  }, 

  set_environment_variables = {
    PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
  } 
}

