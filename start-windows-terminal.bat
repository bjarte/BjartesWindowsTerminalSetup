:: This is really just a single line command. Split up with ^ for readability

:: If you want to use the Preview version of Windows Terminal, replace "wt" with the full path
:: start "" "C:\Program Files\WindowsApps\Microsoft.WindowsTerminalPreview_1.5.3242.0_x64__8wekyb3d8bbwe\wt.exe" -p "Command Prompt"; ^

:: wt is the default Windows Terminal
start "" wt -p "Command Prompt"; ^
new-tab -p "Windows PowerShell" -d C:\Projects\Project1; ^
new-tab -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir1; ^
split-pane -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir2; ^
focus-tab -t 0
