.PHONY: all install uninstall
PREFIX ?= /usr

install:
	install -D -m 0755 com.github.jeysonflores.elementarylua $(PREFIX)/bin/com.github.jeysonflores.elementarylua
	install -D -m 0644 src/Application.lua $(PREFIX)/bin/elementarylua/src/Application.lua
	install -D -m 0644 src/MainWindow.lua $(PREFIX)/bin/elementarylua/src/MainWindow.lua
	install -D -m 0644 src/WelcomeView.lua $(PREFIX)/bin/elementarylua/src/WelcomeView.lua
	install -D -m 0644 data/com.github.jeysonflores.elementarylua.gschema.xml $(PREFIX)/local/share/glib-2.0/schemas/com.github.jeysonflores.elementarylua.gschema.xml
	glib-compile-schemas $(PREFIX)/local/share/glib-2.0/schemas/

uninstall:
	rm -f $(PREFIX)/bin/com.github.jeysonflores.elementarylua
	rm -f $(PREFIX)/bin/elementarylua/src/Application.lua
	rm -f $(PREFIX)/bin/elementarylua/src/MainWindow.lua
	rm -f $(PREFIX)/bin/elementarylua/src/WelcomeView.lua
	rm -f $(PREFIX)/local/share/glib-2.0/schemas/com.github.jeysonflores.elementarylua.gschema.xml
	glib-compile-schemas $(PREFIX)/local/share/glib-2.0/schemas/