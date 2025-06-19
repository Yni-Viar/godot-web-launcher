cd %APPDATA%

3<path.txt (
set /p path= <&3
set /p folder_name= <&3
)

rmdir /S /Q %APPDATA%\GodotWebLauncher\%folder_name%
echo "Godot Web uninstalled"