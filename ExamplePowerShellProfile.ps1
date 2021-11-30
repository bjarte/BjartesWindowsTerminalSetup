Import-Module posh-git
Import-Module oh-my-posh
Import-Module npm-completion
Import-Module -Name Terminal-Icons
#Set-PoshPrompt -Theme Spaceship
#Set-PoshPrompt -Theme Paradox
#Set-PoshPrompt -Theme jandedobbeleer
oh-my-posh --init --shell pwsh --config "C:\Projects\BjartesWindowsTerminalSetup\my-fork-of-jandedobbeleer.omp.json" | Invoke-Expression
