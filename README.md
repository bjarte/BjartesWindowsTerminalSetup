# My setup for Windows Terminal

## Install Windows Terminal

With chocolatey:
``` PowerShell
> cinst microsoft-windows-terminal
```

## Install WSL2 and Ubuntu 20.04

Follow this guide:
https://docs.microsoft.com/en-us/windows/wsl/install-win10

## Install Cascadia font

With chocolatey:
``` PowerShell
> cinst cascadiafonts
```

## Set up synchronized settings

1. Copy Windows Terminal's `settings.json` to a synchronized directory, for example under version control or in Dropbox.

Open PowerShell as Administrator:

2. Delete existing settings directory:
``` PowerShell
> Remove-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -Force –Recurse
```

3. Create symlink to synchronized directory:
``` PowerShell
> New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Target "C:\Projects\BjartesWindowsTerminalSetup"
```

## Set up pretty terminal with Powerline and oh-my-posh

Follow this guide:
https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx

## Create shortcut with several tabs open

NB! Make sure the names of each profile matches what you have in Windows Terminal's `settings.json`. For example, your installation of Ubuntu might just be called "Ubuntu".

Create a bat file, for example `start-windows-terminal.bat`.

The following example opens Windows Terminal with 3 tabs (the last tab with two panes) and gives focus to the first tab after startup:

``` batch
:: This is really just a single line command. Split up with ^ for readability
start "" wt -p "Command Prompt"; ^
new-tab -p "Ubuntu-20.04" -d C:\Projects\Project1; ^
new-tab -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir1; ^
split-pane -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir2; ^
focus-tab -t 0
```

Add a shortcut to this batch file in the Start Menu for easy access.
