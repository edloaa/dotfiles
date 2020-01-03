# dotfiles

My dotfiles and some other customizations for Linux.

## Installation of dotfiles

### Linux

* Installation requires *GNU stow* (https://www.gnu.org/software/stow/)

```sh
$ mkdir -p ~/.MyDotfiles && cd ~/.MyDotfiles
$ git clone https://github.com/edloaa/dotfiles.git
$ cd dotfiles
$ ./install.sh
```

### Windows

* Install
    * Git (https://git-scm.com)
    * Python (https://www.python.org/)
        * ``pip install --user neovim jedi``
    * Curl (https://github.com/curl/curl | https://curl.haxx.se/windows/)
    * Vim (https://www.vim.org/)
        * Use same 'bit version' as Python
    * Hack font (https://github.com/source-foundry/Hack)

(Shell with admin rights)

```sh
# Install dotfile repo
$ mkdir C:\myconf
$ cd C:\myconf
$ git clone https://github.com/edloaa/dotfiles.git
$ cd dotfiles

# Install Vim config (place config file in installation folder)
$ cp _windows/_vimrc "C:\Program Files (x86)\Vim"
```

**TODO**

* Install git config !?

## Installation of other customizations

- Check `other_customs`

![Wake up](./other_customs/fun_tools/wakeupneo/wakeupneo.gif)

