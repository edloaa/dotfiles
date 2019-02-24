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

# Stop the steam locomotive
alias sl='sl -e'

# Source bashrc
alias source_bashrc='source ~/.bashrc'

# Catch common mistakes
alias cd..='cd ..'

# Use python3 as standard interpreter
alias python='python3'

# Python virtual env
alias av='deactivate &> /dev/null; source .venv/bin/activate'
alias dv='deactivate'
alias venv_make='python3 -m venv .venv'
alias venv_freeze='pip freeze > requirements.txt'
alias venv_install='pip install -r requirements.txt'

# Git
alias g='git'

# Ranger
alias r='ranger'

# cd to root of git repository
alias git-root='cd $(git rev-parse --show-toplevel) && pwd'
alias gr='git-root'

# Define what happens when calling vim
alias vim='$VIM_TERM'

# Custom tmux sessions
alias tmux-split='~/.tmux/tmux-split.sh'

# Packages
alias packs='apt-cache search'
alias packin='sudo apt install'

# Create new files from templates
TEMPLATE_DIR="$HOME/.templates"
TEMPLATE_PYTHON="python.py"
TEMPLATE_BASH="bash.sh"
TEMPLATE_C="c.c"
alias templ_py='cp -vi ${TEMPLATE_DIR}/${TEMPLATE_PYTHON} . && eval "$VIM ./${TEMPLATE_PYTHON}"'
alias templ_sh='cp -vi ${TEMPLATE_DIR}/${TEMPLATE_BASH}   . && eval "$VIM ./${TEMPLATE_BASH}"'
alias templ_c='cp -vi  ${TEMPLATE_DIR}/${TEMPLATE_C}      . && eval "$VIM ./${TEMPLATE_C}"'

#  PDFs
pdf_2-1_scale() {
    pdfjam --nup 2x1 ${1} --landscape --a4paper --scale 1.05 --outfile "${1%.*}_mod_2x1.pdf"
}

pdf_2-2_scale() {
    pdfjam --nup 2x2 ${1} --landscape --a4paper --scale 0.92 --outfile "${1%.*}_mod_2x2.pdf"
}

# Convert scanned documents (as jpg-files) to a single A4 pdf-file
pdf_jpg-convert() {
    source_dir="orig"
    dest_dir="proc"

    [[ -z "$1" ]] && threshold_value=80 || threshold_value=$1
    mkdir -p ${dest_dir}

    for file in ${source_dir}/*; do
        convert -threshold ${threshold_value}% \
            ${file} \
            ${dest_dir}/$(basename ${file/.jpg/_proc.jpg})
    done

    convert "${dest_dir}/*" -resize 2481x3507 -units PixelsPerInch \
            -density 300x300 output.pdf
}

ConvertWeirdFileNameCharacters() {
    for file_name in "$@"
    do
        new_file_name=$(echo "$file_name" | sed -e 's/ /_/g' \
                                                -e 's/,/_/g' \
                       )
        mv -v "$file_name" "$new_file_name"
    done
}

