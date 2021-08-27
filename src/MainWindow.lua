local lgi = require 'lgi'
local Gtk = lgi.require('Gtk')
local Handy = lgi.require('Handy')
local Gio = lgi.require('Gio')

require "src.WelcomeView"
-- Window Building

local title_button = Gtk.Button {
    label = "ElementaryLua",
    can_focus = false
}

local title_button_context = title_button:get_style_context():add_class("keycap")

local titlebar = Gtk.HeaderBar {
    custom_title = title_button,
    decoration_layout = "close:",
    show_close_button = true
}

local titlebar_context = titlebar:get_style_context():add_class("flat")

main_window = Gtk.Window {}
main_window:set_titlebar(titlebar)

main_window:add(welcome)

local main_window_context = main_window:get_style_context():add_class("rounded")


function main_window:on_destroy()
    
    local settings = Gio.Settings {
        schema_id = "com.github.jeysonflores.elementarylua"
    }

    local root_x, root_y = main_window:get_position()
    local width, height = main_window:get_size()

    print(width)
    print(height)
    print(root_x)
    print(root_y)

    settings:set_int("pos-x", 500)
    settings:set_int("pos-y", 500)

    settings:set_int("window-width", 600)
    settings:set_int("window-height", 450)

    Gtk.main_quit()
end