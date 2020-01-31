Write-Host "       __|__"
Write-Host "--------(_)--------"
Write-Host "  O  O       O  O"
Write-Host

set HOME="$HOMEDRIVE$HOMEPATH"
Set-Location $HOME
cd $HOME

# Aliases
Set-Alias -Name g -Value git
Set-Alias -Name ll -Value ls

Function OpenFileBrowserHere {explorer .}
Set-Alias -Name t -Value OpenFileBrowserHere
