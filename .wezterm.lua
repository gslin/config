--
local wezterm = require 'wezterm'

local act = wezterm.action
local config = wezterm.config_builder()

config.check_for_updates = false
config.color_scheme = 'Tango (terminal.sexy)'
config.font = wezterm.font_with_fallback({'Hack', 'Noto Sans CJK TC'})
config.font_size = 18.0
config.hide_mouse_cursor_when_typing = false
config.initial_cols = 132
config.initial_rows = 43
config.mouse_bindings = {
    {
        event = {Up = {streak = 1, button = 'Left'}},
        mods = 'NONE',
        action = act.CompleteSelection 'ClipboardAndPrimarySelection',
    },
    {
        event = {Up = {streak = 1, button = 'Left'}},
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    }
}
config.window_padding = {
    bottom = 0,
    left = 0,
    right = 0,
    top = 0,
}

return config
