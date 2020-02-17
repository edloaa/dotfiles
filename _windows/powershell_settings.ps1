Write-Host "       __|__"
Write-Host "--------(_)--------"
Write-Host "  O  O       O  O"
Write-Host

set HOME="$HOMEDRIVE$HOMEPATH"
Set-Location $HOME

# Shortcuts
$dotfiles = "$HOMEDRIVE/myconf/dotfiles"
$desktop = "$HOME/Desktop"
$dev = "$HOME/Desktop/git_tracking"

# ========== Aliases ==========
Set-Alias -Name g -Value git
Set-Alias -Name ll -Value ls
Set-Alias -Name l -Value ls

Function OpenFileBrowserHere {explorer .}
Set-Alias -Name t -Value OpenFileBrowserHere

# Source the settings file
Function SourceSettings {. $HOMEDRIVE/myconf/dotfiles/_windows/powershell_settings.ps1}
Set-Alias -Name source -Value SourceSettings

# Git
Function GitAddAndUpdate {git add -u .; git commit -m "Update"}
Set-Alias -Name gup -Value GitAddAndUpdate

Set-Alias -Name vim -Value nvim

cd $HOME
