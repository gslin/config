--
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.check_for_updates = false
config.color_scheme = 'Tango (terminal.sexy)'
config.disable_default_mouse_bindings = true
config.font = wezterm.font_with_fallback({'Hack', 'Noto Sans CJK TC'})
config.font_size = 18.0
config.hide_mouse_cursor_when_typing = false
config.initial_cols = 132
config.initial_rows = 43
config.window_padding = {
    bottom = 0,
    left = 0,
    right = 0,
    top = 0,
}

return config
