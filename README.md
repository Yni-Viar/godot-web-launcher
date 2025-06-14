## Godot Web installer and launcher.

Since Godot 4.5 removes support for Windows 7-8.x, I created a quick batch file for launching Web editor.

If you are on Windows 7-8.x, it's recommended to use [Supermium](https://github.com/win32ss/supermium/releases)

This script will download latest Godot Web Editor, Godot Minimal Web Server which is included in Godot's source code, [The demo file with my "undeleteable file error" bugfix](https://github.com/Yni-Viar/godot-web-editor-delete-workaround),
7-zip (if user specifies), Python 3.8 (if user specifies - the last version, that supports Windows 7) and install into %APPDATA%/GodotWebLauncher folder

⚠️ **Even there are no threats in this batch script, please, use AT YOUR OWN RISK, since it will use your user's Documents and AppData folder (%APPDATA%/GodotWebLauncher) and download third-party programs (listed in description). Launch batch script will also use AppData folder. I am NOT RESPONSIBLE for your sudden problems (if they somehow appear). (see LICENSE)**

⚠️ Currently, this batch script is useless, because the next Godot version did not even release.