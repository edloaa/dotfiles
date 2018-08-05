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

- dropbox & "thunar support" (?)
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
- keepassxc
- ktouch
- latex & texlive & texmaker & jabref
- nmap
- pandoc & pandoc-citeproc
- terminator
- thunderbird
- ttf-mscorefonts-installer (Microsoft fonts)
- vim & gvim
- vlc
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
- seahorse
- skypeforlinux
- spotify
- toilet
- tor browser
- translate-shell (`trans`, Command-line translator using Google Translate)
- virtual-box
- wikipedia2text
- xflr5

** Also check **

- neovim (& GUI version)
- ssh

