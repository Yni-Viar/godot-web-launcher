@echo off
setlocal enabledelayedexpansion

cd /D C:/
set install_python=n
set install_7zip=n

set /p install_python= Install Python? (necessary, if not installed) [y/n]
if install_python == y (goto :python) else (goto :continue-python)

:python
:: Python 3.8, last supported on Windows 7
bitsadmin.exe /transfer "Downloading Python 3.8" https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe %USERPROFILE%\Documents\pythonsetup.exe
%USERPROFILE%\Documents\pythonsetup.exe
echo "Press Enter, ONLY if you finished installing Python!"
pause
goto :continue-python

:continue-python
set /p install_7zip= Install 7-zip? (necessary, if not installed) [y/n]
if install_7zip == y (goto :sevenzip) else (goto :continue-7zip)

:sevenzip
bitsadmin.exe /transfer "Downloading 7-zip" https://www.7-zip.org/a/7z2409-x64.exe %USERPROFILE%\Documents\7zip.exe
%USERPROFILE%\Documents\7zip.exe /S
echo "Wait for 15 seconds to install 7-zip and press Enter"
pause
goto :continue-7zip

:continue-7zip
cd %APPDATA%
mkdir GodotWebLauncher
bitsadmin.exe /transfer "Downloading launch script" https://raw.githubusercontent.com/godotengine/godot/refs/heads/master/platform/web/serve.py %APPDATA%\GodotWebLauncher\Editor\serve.py
bitsadmin.exe /transfer "Downloading Godot Web Editor" https://github.com/godotengine/godot/releases/download/4.4.1-stable/Godot_v4.4.1-stable_web_editor.zip %APPDATA%\GodotWebLauncher\Editor\godot.zip
bitsadmin.exe /transfer "Downloading Godot Web Editor" https://github.com/Yni-Viar/godot-web-editor-delete-workaround/archive/refs/heads/main.zip %APPDATA%\GodotWebLauncher\Editor\demo.zip
cd C:\Program Files\7-Zip
7z.exe e %APPDATA%\GodotWebLauncher\Editor\godot.zip -o%APPDATA%\GodotWebLauncher\Editor
cd %APPDATA%\GodotWebLauncher\Editor
del godot.zip
echo "Install finished."
cd %USERPROFILE%

goto :EOF