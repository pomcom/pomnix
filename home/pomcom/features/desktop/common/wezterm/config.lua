local action = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'

config.font = wezterm.font 'Fira Code'
config.font_size = 17.4

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.window_background_opacity = 0.85
config.text_background_opacity = 0.95

config.window_padding = {
  left = 4,
  right = 2,
  top = 0,
  bottom = 0,
}

config.scrollback_lines = 3500
config.enable_scroll_bar = true
config.window_close_confirmation = 'AlwaysPrompt'

wezterm.on('update-right-status', function(window, _)
  local key_table = window:active_key_table()
  if key_table then
    key_table = 'TABLE: ' .. key_table
  end

  -- Always show active workspace
  -- Show active key table only if present
  window:set_right_status(window:active_workspace() .. ' | ' .. (key_table or ''))
end)

local activateResizeMode = action.ActivateKeyTable {
  name = 'resize_pane',
  one_shot = true,
  timeout_milliseconds = 500,
}

config.disable_default_key_bindings = true
config.leader = { key = 'f', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = config.leader.key,
    mods = 'LEADER|CTRL',
    action = action { SendString = '\x01' }
  },

  {
    key = 'h',
    mods = 'LEADER|CTRL',
    action = action.Multiple {
      action.AdjustPaneSize { 'Left', 5 },
      activateResizeMode,
    },
  },
  {
    key = 'j',
    mods = 'LEADER|CTRL',
    action = action.Multiple {
      action.AdjustPaneSize { 'Down', 5 },
      activateResizeMode,
    },
  },
  {
    key = 'k',
    mods = 'LEADER|CTRL',
    action = action.Multiple {
      action.AdjustPaneSize { 'Up', 5 },
      activateResizeMode,
    },
  },
  {
    key = 'l',
    mods = 'LEADER|CTRL',
    action = action.Multiple {
      action.AdjustPaneSize { 'Right', 5 },
      activateResizeMode,
    },
  },

  {
    key = 'o',
    mods = 'LEADER|SHIFT',
    action = action.Multiple {
      action { EmitEvent = "activate-last-pane" },
      action.TogglePaneZoomState,
    }
  },

  {
    key = "Space",
    mods = "LEADER",
    action = wezterm.action.RotatePanes "Clockwise"
  },
  {
    key = '?',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.PaneSelect {
      mode = 'SwapWithActive',
    },
  },

  {
    key = 'a',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncher,
  },

  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" },
  },
  {
    key = 'L',
    mods = 'LEADER | SHIFT',
    action = action.SwitchWorkspaceRelative(1) -- TODO: Is there a way to switch to last active ws?
  },

  {
    key = 'S',
    mods = 'LEADER|SHIFT',
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },

  {
    key = '>',
    mods = 'LEADER|SHIFT',
    action = action.MoveTabRelative(1),
  },
  {
    key = '<',
    mods = 'LEADER|SHIFT',
    action = action.MoveTabRelative(-1),
  },
  {
    key = 'f', -- TODO: Consider choosing a different key to be able to pass leader through
    mods = 'LEADER|CTRL',
    action = action.ActivateLastTab,
  },
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = action { SplitVertical = { domain = 'CurrentPaneDomain' } }
  },
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = action { SplitHorizontal = { domain = 'CurrentPaneDomain' } }
  },
  {
    key = 'o',
    mods = 'LEADER',
    action = 'TogglePaneZoomState'
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = 'TogglePaneZoomState'
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = action { SpawnTab = 'CurrentPaneDomain' }
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = action { ActivatePaneDirection = 'Left' }
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = action { ActivatePaneDirection = 'Down' }
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = action { ActivatePaneDirection = 'Up' }
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = action { ActivatePaneDirection = 'Right' }
  },
  {
    key = ';',
    mods = 'LEADER',
    action = action { ActivatePaneDirection = "Next" } -- TODO: Replace this with last active tab when possible
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = action { ActivateTabRelative = 1 }
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = action { ActivateTabRelative = -1 }
  },
  {
    key = '1',
    mods = 'LEADER',
    action = action { ActivateTab = 0 }
  },
  {
    key = '2',
    mods = 'LEADER',
    action = action { ActivateTab = 1 }
  },
  {
    key = '3',
    mods = 'LEADER',
    action = action { ActivateTab = 2 }
  },
  {
    key = '4',
    mods = 'LEADER',
    action = action { ActivateTab = 3 }
  },
  {
    key = '5',
    mods = 'LEADER',
    action = action { ActivateTab = 4 }
  },
  {
    key = '6',
    mods = 'LEADER',
    action = action { ActivateTab = 5 }
  },
  {
    key = '7',
    mods = 'LEADER',
    action = action { ActivateTab = 6 }
  },
  {
    key = '8',
    mods = 'LEADER',
    action = action { ActivateTab = 7 }
  },
  {
    key = '9',
    mods = 'LEADER',
    action = action { ActivateTab = 8 }
  },
  {
    key = '&',
    mods = 'LEADER|SHIFT',
    action = action { CloseCurrentTab = { confirm = true } }
  },
  {
    key = 'd',
    mods = 'LEADER',
    action = action { CloseCurrentPane = { confirm = true } }
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = action { CloseCurrentPane = { confirm = true } }
  },
  {
    key = '[',
    mods = 'LEADER',
    action = action.ActivateCopyMode
  },
  {
    key = ']',
    mods = 'LEADER',
    action = action { PasteFrom = 'Clipboard' }
  },
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = action { CopyTo = 'Clipboard' }
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = action { PasteFrom = 'Clipboard' }
  },
  {
    key = 'q',
    mods = 'LEADER',
    action = action.QuickSelect
  },
  {
    key = '/',
    mods = 'LEADER',
    action = action.Search { CaseInSensitiveString = '' }
  },
  {
    key = 'u',
    mods = 'LEADER',
    action = action.QuickSelectArgs {
      label = 'Open URL',
      patterns = { 'https?://\\S+' },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.open_with(url)
      end),
    },
  },
  {
    key = ',',
    mods = 'LEADER',
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter new name for tab' },
      },
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = ':',
    mods = 'LEADER|SHIFT',
    action = action.ActivateCommandPalette
  },
  { key = '=', mods = 'CTRL', action = action.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = action.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = action.ResetFontSize },
}

config.key_tables = {
  resize_pane = {
    {
      key = 'h',
      mods = 'CTRL',
      action = action.Multiple {
        action.AdjustPaneSize { 'Left', 5 },
        activateResizeMode
      }
    },
    {
      key = 'j',
      mods = 'CTRL',
      action = action.Multiple {
        action.AdjustPaneSize { 'Down', 5 },
        activateResizeMode
      }
    },
    {
      key = 'k',
      mods = 'CTRL',
      action = action.Multiple {
        action.AdjustPaneSize { 'Up', 5 },
        activateResizeMode
      }
    },
    {
      key = 'l',
      mods = 'CTRL',
      action = action.Multiple {
        action.AdjustPaneSize { 'Right', 5 },
        activateResizeMode
      }
    },
  },
}

return config
