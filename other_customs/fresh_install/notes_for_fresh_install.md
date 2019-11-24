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

**Essentials**

- conky
- firefox
- gimp
- gparted
- htop
- inkscape
- kdeconnect
- ktouch
- latex (etc.)
- synapse (utility to launch everything on your computer)
- thunderbird
- ttf-mscorefonts-installer (Microsoft fonts)
- vlc
- youtube-dl

**Development**

- curl
- editorconfig
- espeak
- faker
- fonts-hack-ttf  # https://github.com/source-foundry/Hack
- gcc
- git & gitk
- gocryptfs
- gpg (gnupg)
- jupyter-notebook
- neovim
- octave
- pandoc & pandoc-citeproc
- sloccount
- ssh
- stow
- tmux
- tree
- urlview
- vim & gvim
- virtualenvwrapper
- wget
- wireshark
- xclip

**Privacy, backups, etc.**

- enigmail
- keepassxc
- nmap
- pwgen
- rsync
- seahorse
- tor browser
- zulucrypt

**Misc**

- cheese
- cmatrix
- cowsay
- dia
- dropbox & "thunar support" (?)
- faenza-icon-theme
- figlet
- fortune
- gsmartcontrol
- guake (alternative terminal)
- matlab
- meld
- nethack
- ranger
- skypeforlinux
- sl
- speedpad
- spotify
- taskwarrior & tasksh
- terminator
- toilet
- translate-shell (`trans`, Command-line translator using Google Translate)
- virtual-box
- wikipedia2text
- xflr5
