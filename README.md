# Godot Web installer and launcher.

Since Godot 4.5 removes support for Windows 7-8.x, I "ported" Web editor, using Electron (since v.2.0, 1.0 is UNSAFE!!!).

**⚠️ This is NOT a panacea for such an old OS. For better work, I suggest move to Linux. There are Windows 7-like themes (for example, KDE has Oxygen theme, and Weston looks like Windows 7 Basic)**

## Building

Run build-godot-web.bat to quickly build the app and launch.
If a CMD window pops out AND is waiting for your command - close it.
Type 'N' if the main CMD if it want you to quit - some tasks should be done in separate windows.

## License
build-godot-web.bat is licensed under CC0.
*.js, *.json - these are examples from Electron framework, Electron Forge and Express web server.  They are licensed by their MIT License.
icon.ico contains Godot logo. It is made by Andrea Calabró licensed under CC-BY 4.0