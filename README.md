# My setup for Windows Terminal

I have a setup for Windows Terminal that looks like the image below. What is different from a standard setup, is the following:

- Multiple tabs and panes with predefined startup directories
- Settings are synchronized across multiple computers
- Git integration shows current branch
- CaskaydiaCove font, which is made specifically for developers

![alt text](https://raw.githubusercontent.com/bjarte/BjartesWindowsTerminalSetup/master/example-of-end-result.png "Example of Windows Terminal with three tabs and two tabs")

To recreate this setup, follow the steps below.

## Install Windows Terminal

With chocolatey:

``` PowerShell
choco install microsoft-windows-terminal
```

## Install WSL2 and Ubuntu 22.04

Follow this guide:
<https://learn.microsoft.com/en-us/windows/wsl/install>

## Install CaskaydiaCove font

Download a nerdfont like CaskaydiaCove here:
<https://www.nerdfonts.com/font-downloads>

To use the CaskaydiaCove font in Windows Terminal, open `settings.json` and set your profiles' font to *CaskaydiaCove NF*. 

You can also change the font and colur scheme in Windows Terminal's settings.

``` JSON
"profiles": [
  {
    "font": { face": "CaskaydiaCove NF" },
    "colorScheme": "One Half Dark",
  }
]
```

## Set up synchronized settings

1. Copy Windows Terminal's `settings.json` to a synchronized directory, for example under version control or in OneDrive.

2. Open PowerShell as Administrator.

3. Delete existing settings directory. Note, if you use the preview version of Windows Terminal, the path will be different:

``` PowerShell
Remove-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState -Force –Recurse
```

4. Create symlink to synchronized directory:

``` PowerShell
New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState" -Target "C:\Projects\BjartesWindowsTerminalSetup"
```

## Set up pretty terminal with Powerline and oh-my-posh

Based on this (old) guide:
<https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx>

And the oh-my-posh installation guide for Windows:

<https://ohmyposh.dev/docs/installation/windows>

1. Install oh-my-posh

``` PowerShell
choco install oh-my-posh
```

1. Install PowerShell modules:

``` PowerShell
Install-Module posh-git -Scope CurrentUser
Install-Module npm-completion -Scope CurrentUser
Install-Module Terminal-Icons -Scope CurrentUser
```

2. Set up PowerShell profile:

``` PowerShell
notepad $profile
```

Add the following to your profile:

``` PowerShell
Import-Module posh-git
Import-Module npm-completion
Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config "C:\Program Files (x86)\oh-my-posh\themes\spaceship.omp.json" | Invoke-Expression
```

You can find loads of other cool themes here:
<https://ohmyposh.dev/docs/themes>

Another favorite of mine is [jandedobbeleer](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/jandedobbeleer.omp.json).

💡 Posh-git requires a *powerline* font. This is what is used to add for example git branch symbols to the command line. CaskaydiaCove has a powerline font.

🚨 The guide above is just for PowerShell. Basic command line (cmd.exe) doesn't have a posh setup, and if you want to posh up your Ubuntu terminal, follow oh-my-posh's Linux installation guide:

<https://ohmyposh.dev/docs/installation/linux>

## Create shortcut for Terminal with several tabs open

Windows Terminal doesn't (yet) have a way to set up multiple tabs and startup directories in `settings.json`, so we need to create a batch file with all the necessary settings.

🚨 Make sure the names of each profile matches what you have in Windows Terminal's `settings.json`. For example, your installation of Ubuntu might just be called "Ubuntu".

Create a batch file, for example `start-windows-terminal.bat`.

The following example opens Windows Terminal with 3 tabs (the last tab with two panes) and gives focus to the first tab after startup:

``` batch
:: This is really just a single line command. Split up with ^ for readability
start "" wt -p "Command Prompt"; ^
new-tab -p "PowerShell" -d C:\Projects\Project1; ^
new-tab -p "Ubuntu-22.04" -d C:\Projects\Project2\Subdir1; ^
split-pane -p "Ubuntu-22.04" -d C:\Projects\Project2\Subdir2; ^
focus-tab -t 0
```

Add a shortcut to this batch file in the Start Menu for easy access.

💡 If you'd like, you can set the shortcut to always open Windows Terminal as an administrator.

## More useful tools and setup

### WSL: Set up zsh as shell and add oh-my-posh

```bash
apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Use Volta in Windows and Linux to easily switch between versions of node

```PowerShell
choco install volta
volta install node npm # Installs latest version of node and npm
volta install node@20 npm@9 # Installs specific versions of node and npm
```

```bash
curl https://get.volta.sh | bash
```
