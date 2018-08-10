# BASH alias, sourced by ~/.bashrc
# ================================

alias cp='cp -i' # confirm before overwriting something
alias prgrep='pgrep -fl'

# SSH to Raspberry Pi
alias sshrp='ssh pi@mango'
alias sshrp_shutdown='ssh pi@mango "sudo shutdown -h now"'

# System update and apt-clean-up
alias sysupd='sudo apt-get update && sudo apt-get upgrade'
alias aptclean='sudo apt-get autoremove && sudo apt-get clean && sudo apt-get autoclean'

# Check internet connections
alias chincon='sudo netstat -tupan'

# Copy with rsync (useful for large or many files, shows progress)
alias cpwr='rsync -Pavh --stats "$@"'

# Compute md5sums recursively and save in file
alias md5sum_recursive='find . -type f -exec md5sum {} > md5sum.txt \;'

# Get today's date in format yyyy-mm-dd
alias today='date "+%F"'

# Close terminal like Vim
alias :q='exit'

# Shortcut for thunar
alias t='thunar'

# More useful calender
alias cal='ncal -b -w -A1'

