"  _    ___                        __  __  _
" | |  / (_)___ ___     ________  / /_/ /_(_)___  ____ ______
" | | / / / __ `__ \   / ___/ _ \/ __/ __/ / __ \/ __ `/ ___/
" | |/ / / / / / / /  (__  )  __/ /_/ /_/ / / / / /_/ (__  )
" |___/_/_/ /_/ /_/  /____/\___/\__/\__/_/_/ /_/\__, /____/
"                                              /____/

" ---------- PLUGINS ----------

" VIM-PLUG plugin manager (https://github.com/junegunn/vim-plug)
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plug 'nelstrom/vim-markdown-folding'
" Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'bronson/vim-visual-star-search'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lervag/vimtex'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

" Snipptes and completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" Shortcut for updating VIM-PLUG and all other plugins
command! PU w | source $MYVIMRC | PlugUpdate | PlugUpgrade

" ---------- PLUGIN SETTINGS ----------

" NERDTREE
let NERDTreeShowHidden = 1

" VIM-INDENT-GUIDES
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level   	  = 1
let g:indent_guides_guide_size            = 1

" GRUVBOX
let g:gruvbox_contrast_dark = 'hard' " Options: soft, medium (default), hard

" VIM-COLORS-SOLARIZED
let g:solarized_contrast   = "high" " default value is normal
let g:solarized_visibility = "high" " default value is normal
let g:solarized_diffmode   = "high" " default value is normal

" VIM-AIRLINE
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" VIM-AIRLINE-THEMES
let g:airline_theme = 'wombat'

" SYNTASTIC
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_python_python_exec       = 'python3'

" VIMTEX
let g:vimtex_compiler_latexmk = {
    \ 'backend'    : 'jobs',
    \ 'background' : 1,
    \ 'build_dir'  : 'build',
    \ 'callback'   : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options'    : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" ULTISNIPS
let g:UltiSnipsExpandTrigger       = "<S-Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-b>"
let g:UltiSnipsJumpBackwardTrigger = "<C-z>"

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" JEDI-VIM
let g:jedi#use_splits_not_buffers = "right"

" ---------- BASIC SETTINGS ----------

set encoding=utf-8  " Standard character encoding
set shell=/bin/bash " Standard shell
syntax enable 	    " Syntax highlighting

if ! has("nvim")
    " packadd! matchit          " Load Vim's matchit plugin
    filetype plugin indent on " Turns on 'detection', 'plug-in' and 'indent'
    set showcmd               " Show command in bottom bar
    set ruler                 " Show line and column number of cursor position
    set hlsearch              " Highlight matches
    set incsearch             " Search results are highlighted while typing
    set autoindent            " Indent from current line when starting a new line
    set backspace=2           " Backspace over autoindent/line break/start of insert
    set autoread              " Automatically read external file changes
    set smarttab
endif

set confirm          " Dialogue when an operation has to be confirmed
set visualbell t_vb= " Visual bell instead of beeping
set mouse=a          " Enable use of the mouse for all modes
set notimeout ttimeout ttimeoutlen=100 " Quickly time out on keycodes, but never time out on mappings (?)

set shortmess+=I          " Do not show Vim standard startup message
set number relativenumber " Show relative line numbers
set cursorline            " Highlight current line
set laststatus=2          " Always display the status line
set cmdheight=2           " Number of screen lines to use for command-line
set scrolloff=1           " Vertical scroll offset
set sidescrolloff=5       " Horizontal scroll offset
set linebreak             " Wrap text at full words
set showbreak=@           " Characters indicating line wrapping
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$ " Invisibles

set showmatch             " Highlight matching brackets
set shiftwidth=4 softtabstop=4 expandtab " Use 4 spaces instead of tabs
set smartindent

set wildmode=longest,list   " Bash-shell-like autocompletion
set history=1000            " Last 1000 commands are recorded in command line (:)
set hidden                  " Makes it easier to create hidden buffers
set path+=./**              " :find looks for files in all subdirectories
set foldlevelstart=10       " Open most folds by default
set foldmethod=indent       " Fold based on indent level
set wildignore+=*.swp,*.zip " Patterns to ignore when expanding wildcards
set complete+=kspell        " Autocomplete with dictionary words when spell check is on

set nostartofline    " Keep horizontal cursor position when scrolling
set nrformats-=octal
set formatoptions+=j " Delete comment character when joining commented lines
set spelllang=en_gb  " Standard language for spell checking
                     " --> other important languages:
                     "     - en_us : USA
                     "     - de_20 : new German spelling

" set autowrite         " Automatically :write before running commands
set splitright        " Vsplit to the right side
set nojoinspaces      " Use one space, not two, after punctuation.
set diffopt+=vertical " Always use vertical diffs

set background=dark " Always use dark mode
colorscheme gruvbox " Standard colorscheme
" ----------
set textwidth=0
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" ---------- SOURCE ADDITIONAL CONFIG FILES ----------

" source if file exists
function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

" Source:
" - Key mappings
" - Abbreviations and autocorrect
" - Private settings
call SourceIfExists("~/.vim/my_config/mappings.vim")
call SourceIfExists("~/.vim/my_config/abbreviations.vim")
call SourceIfExists("~/.vimrc_priv")

