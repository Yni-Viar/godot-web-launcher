@echo off
setlocal enabledelayedexpansion

set install_njs=n
set install_python=n
set install_7zip=n

echo Welcome to Godot4Win7 2.0 Auto-builder!
echo Note, that building process requires Windows 10 and newer.
echo If you are on Windows 7-8.1, please close the program.
set /p install_njs= Install Node-JS? (necessary, if not installed) [y/n]
if install_njs == y (goto :node-js) else (goto :continue-njs)

:node-js
bitsadmin.exe /transfer "Downloading Node JS" https://nodejs.org/dist/v22.19.0/node-v22.19.0-x64.msi %TEMP%\nodejs.msi
msiexec.exe /i %USERPROFILE%\Documents\nodejs.msi /qn

:continue-njs
set /p install_7zip= Install 7-zip? (necessary, if not installed) [y/n]
if install_7zip == y (goto :sevenzip) else (goto :continue-7zip)

:sevenzip
bitsadmin.exe /transfer "Downloading 7-zip" https://www.7-zip.org/a/7z2409-x64.exe %TEMP%\7zip.exe
%USERPROFILE%\Documents\7zip.exe /S
echo "Wait for 15 seconds to install 7-zip and press Enter"
pause
goto :continue-7zip

:continue-7zip
if exist %TEMP%\godot.zip (goto :skip-godot)
bitsadmin.exe /transfer "Downloading Godot Web Editor" https://github.com/godotengine/godot/releases/download/4.4.1-stable/Godot_v4.4.1-stable_web_editor.zip %TEMP%\godot.zip
:skip-godot
if exist %~dp0\app\demo.zip (goto :skip-demo)
bitsadmin.exe /transfer "Downloading Godot Web Editor Demo" https://github.com/Yni-Viar/godot-web-editor-delete-workaround/archive/refs/heads/main.zip %~dp0\app\demo.zip
:skip-demo
cd /D C:\Program Files\7-Zip
7z.exe e %TEMP%\godot.zip -o%~dp0\app
cd /D %~dp0
start /w cmd /k npm install
start /w cmd /k npx electron-forge import
start /w cmd /k npm run make
echo "Build finished."

goto :EOF