local lgi = require 'lgi'
local Gtk = lgi.require('Gtk')
local Gio = lgi.require('Gio')
local Granite = lgi.require('Granite')
local GLib = lgi.require('GLib')


require "src.MainWindow"

local app = Gtk.Application {
    application_id = "com.github.jeysonflores.elementarylua"
}


function app:on_activate()
    main_window.application = self

    local settings = Gio.Settings {
        schema_id = "com.github.jeysonflores.elementarylua"
    }

    local granite_settings = Granite.Settings{}
    local gtk_settings = Gtk.Settings:get_default()
    

    if granite_settings.prefers_color_scheme == "DARK" then
        gtk_settings.gtk_application_prefer_dark_theme = true
    else
        gtk_settings.gtk_application_prefer_dark_theme = false
    end

    granite_settings.on_notify["prefers-color-scheme"] = function(self, pspec)
        if granite_settings.prefers_color_scheme == "DARK" then
            gtk_settings.gtk_application_prefer_dark_theme = true
        else
            gtk_settings.gtk_application_prefer_dark_theme = false
        end
    end

    main_window:resize(settings:get_int("window-width"), settings:get_int("window-height"))
    main_window:move(settings:get_int("pos-x"), settings:get_int("pos-y"))
    
    main_window:show_all()
end


app:run { arg[0], ... }