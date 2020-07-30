:: This is really just a single line command. Split up with ^ for readability
start "" wt -p "Command Prompt"; ^
new-tab -p "PowerShell" -d C:\Projects\Project1; ^
new-tab -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir1; ^
split-pane -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir2; ^
focus-tab -t 0
