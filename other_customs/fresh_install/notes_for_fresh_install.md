# NOTES FOR FRESH INSTALL

## Interesting distros

- Xubuntu
- Manjaro

## Steps after fresh install

1. Install dotfiles and other customisations
    1. `~/.MyDotfiles/dotfiles/` (pub)
    2. `~/.MyDotfiles/dotfiles.priv/` (priv)
    3. `~/projects/` (priv)
2. Extract GPG and SSH config and install in $HOME
3. Install additional software (see list below)
4. Set up cron jobs
5. Check /etc files & update HOSTS file

```
$ wget -q -O - "http://someonewhocares.org/hosts/hosts" | grep -E "^127.0.0.1" > hosts
$ sudo cp /etc/hosts /etc/hosts.bak
==> Then concat "hosts" to "/etc/hosts"
```

## Useful software

**ESSENTIALS**

- conky
- curl
- dropbox & "thunar support" (?)
- editorconfig
- enigmail
- firefox
- gimp
- git & gitk
- gocryptfs
- gparted
- gpg (gnupg)
- gsmartcontrol
- htop
- inkscape
- kdeconnect
- keepassxc
- ktouch
- latex & texlive & texmaker & jabref
- nmap
- pandoc & pandoc-citeproc
- pwgen
- pycharm
- rsync
- stow
- taskwarrior & tasksh
- terminator
- thunderbird
- ttf-mscorefonts-installer (Microsoft fonts)
- vim & gvim
- vlc
- wireshark (& GUI)
- xclip
- youtube-dl
- zulucrypt

**SECONDARY**

- akregator
- cheese
- cmatrix
- cowsay
- dia
- faenza-icon-theme
- faker
- figlet
- fortune
- gcc
- guake (alternative terminal)
- matlab
- meld
- nethack
- octave
- seahorse
- skypeforlinux
- sl
- spotify
- toilet
- tor browser
- translate-shell (`trans`, Command-line translator using Google Translate)
- virtual-box
- wikipedia2text
- xflr5

**Also check**

- espeak
- neovim (& GUI version)
- ssh
- tmux
- wget
