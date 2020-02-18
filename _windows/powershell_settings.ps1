Write-Host "       __|__"
Write-Host "--------(_)--------"
Write-Host "  O  O       O  O"
Write-Host

# See $PROFILE file
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7

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
Function SourceSettings {. $PROFILE}
Set-Alias -Name source -Value SourceSettings

# Git
Function GitAddAndUpdate {git add -u .; git commit -m "Update"}
Set-Alias -Name gup -Value GitAddAndUpdate

Set-Alias -Name vim -Value nvim

cd $HOME

function prompt {
        $lastResult = Invoke-Expression '$?'
        if (!$lastResult) {
                Write-Host "Last command exited with error status." -ForegroundColor Red
        }
        Write-Output "${msg}$(
                # Show time as 12:05PM
                Get-Date -UFormat "%I:%M%p"
                # Show current directory
        ) $(Get-Location)> "
}
