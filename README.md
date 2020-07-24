## Install Windows Terminal

With chocolatey:
```
> cinst microsoft-windows-terminal
```

## Install Cascadia font

With chocolatey:
```
> cinst cascadiafonts
```

## How to use synchronized settings

Open PowerShell as Administrator:

1. Delete existing settings directory:
```
Remove-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -Force –Recurse
```

2. Create symlink to synchronized directory (correct path if necessary):
```
> New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Target "C:\Users\bjarte\Dropbox\Work Tools\Windows Terminal Settings"
```

## Set up pretty terminal

Guide here:
https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx

## Create shortcut with several tabs open

Create a bat file:
```
start "" wt -p "Ubuntu-20.04" -d C:\Projects\Diabetesforbundet\src\Diabetes\Diabetesforbundet.Web; new-tab -p "Ubuntu-20.04" -d C:\Projects\WhosThere-Web\src\Stats; new-tab -p "Ubuntu-20.04" -d C:\Projects\WhosThere-Web\src\Site; new-tab -p "Command Prompt"
```
