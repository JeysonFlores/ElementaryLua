![Screenshot](https://github.com/JeysonFlores/ElementaryLua/blob/master/data/assets/screenshots/screenshot-1.png) 
![Screenshot](https://github.com/JeysonFlores/ElementaryLua/blob/master/data/assets/screenshots/screenshot-2.png) 

# Description
ElementaryLua is a template for eOS applications, meaning that it's built over Gtk, Granite and Flatpak but running over LuaJIT.

# Features
 - ElementaryOS 6 Dark Mode Support
 - GSchema Support
# Build & Run
 ```
git clone https://github.com/JeysonFlores/ElementaryLua
cd ElementaryLua
flatpak-builder build com.github.jeysonflores.elementarylua.yml --user --install --force-clean
flatpak run com.github.jeysonflores.elementarylua
 ```
 
