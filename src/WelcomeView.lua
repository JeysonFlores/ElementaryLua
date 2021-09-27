package.path = package.path .. ";/app/bin/elementarylua/?.lua;/app/share/lua/5.1/?.lua"
package.cpath = package.cpath .. ";/app/lib/lua/5.1/?.so"

local lgi = require 'lgi'
local Gtk = lgi.require('Gtk')
local Granite = lgi.require('Granite')

WelcomeView = {}

function WelcomeView.new()
    local welcome = Granite.WidgetsWelcome {
        title = "Welcome to ElementaryLua",
        subtitle = "It's just a template"
    }

    welcome:append("network-workgroup", "Lua Official Page", "The Official Website of Lua.")
    welcome:append ("applications-development", "LGI Bindings", "GTK Bindings for Lua.")
    welcome:append ("distributor-logo", "Elementary Docs", "Documentation Guide for Devs.")

    local welcome_context = welcome:get_style_context():remove_class("view")

    function welcome:on_activated(index)
        if index == 0 then
            os.execute("xdg-open https://www.lua.org/")
        elseif index == 1 then
            os.execute("xdg-open https://github.com/pavouk/lgi")
        elseif index == 2 then
            os.execute("xdg-open https://docs.elementary.io/develop/")
        end
    end

    return welcome
end