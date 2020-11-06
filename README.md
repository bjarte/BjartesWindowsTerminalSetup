# My setup for Windows Terminal

I have a setup for Windows Terminal that looks like the image below, with multiple tabs and panes with predefined startup directories. The settings are also synched across multiple computers.

![alt text](https://raw.githubusercontent.com/bjarte/BjartesWindowsTerminalSetup/master/example-of-end-result.png "Example of Windows Terminal with three tabs and two tabs")

To recreate this setup, follow the steps below.

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
To use the Cascadia font in Windows Terminal, open `settings.json` and set your profiles' font to *Cascadia Code PL*:
``` JavaScript
"profiles": [
  {
    "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
    "name": "Windows PowerShell",
    "fontFace": "Cascadia Code PL",
    "colorScheme": "Solarized Dark",
    "commandline": "powershell.exe"
  }
]
```

## Set up synchronized settings

1. Copy Windows Terminal's `settings.json` to a synchronized directory, for example under version control or in Dropbox.

2. Open PowerShell as Administrator.

3. Delete existing settings directory:
``` PowerShell
> Remove-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -Force –Recurse
```

4. Create symlink to synchronized directory:
``` PowerShell
> New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Target "C:\Projects\BjartesWindowsTerminalSetup"
```

## Set up pretty terminal with Powerline and oh-my-posh

Follow this guide:
https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx

💡 I disabled Powerline and oh-my-posh after a while, because it makes the terminal quite slow, especially in the Linux/WSL tab.

## Create shortcut for Terminal with several tabs open

Windows Terminal doesn't (yet) have a way to set up multiple tabs and startup directories in `settings.json`, so we need to create a batch file with all the necessary settings.

🚨 Make sure the names of each profile matches what you have in Windows Terminal's `settings.json`. For example, your installation of Ubuntu might just be called "Ubuntu".

Create a batch file, for example `start-windows-terminal.bat`.

The following example opens Windows Terminal with 3 tabs (the last tab with two panes) and gives focus to the first tab after startup:

``` batch
:: This is really just a single line command. Split up with ^ for readability
start "" wt -p "Command Prompt"; ^
new-tab -p "PowerShell" -d C:\Projects\Project1; ^
new-tab -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir1; ^
split-pane -p "Ubuntu-20.04" -d C:\Projects\Project2\Subdir2; ^
focus-tab -t 0
```

Add a shortcut to this batch file in the Start Menu for easy access.

💡 If you'd like, you can set the shortcut to always open Windows Terminal as an administrator.
