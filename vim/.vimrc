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

" Plugin 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
Plug 'bronson/vim-visual-star-search'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'lervag/vimtex'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-markdown-folding'
Plug 'scrooloose/nerdtree'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

call plug#end()

" Shortcut for updating VIM-PLUG and all other plugins
command! PU w | source $MYVIMRC | PlugUpdate | PlugUpgrade

" ---------- PLUGIN SETTINGS ----------

" NERDTREE
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" STRIP-TRAILING-WHITESPACE
nnoremap <F5> :FixWhitespace<CR>

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
let g:airline_theme='wombat'

" SYNTASTIC
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

" VIM-UNIMPAIRED
" bubble single lines
nmap <C-Up>   [e
nmap <C-Down> ]e
" bubble multiple lines
vmap <C-Up>   [egv
vmap <C-Down> ]egv

" CTRLP
let g:ctrlp_map = '<c-p>'     " change mapping to invoke CtrlP in Normal mode
let g:ctrlp_cmd = 'CtrlP'     " default opening command for above mapping
let g:ctrlp_by_filename   = 1 " search by filename (as opposed to full path)
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files = 10000 " maximum number of files to scan
let g:ctrlp_max_depth = 40    " maximum depth of directory tree to recurse into

" VIMTEX
" let g:vimtex_fold_enabled

let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'jobs',
    \ 'background' : 1,
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

" ---------- BASIC SETTINGS ----------

set nocompatible          " disable Vi compatibility
set encoding=utf-8        " standard character encoding
set shell=/bin/bash       " standard shell
syntax enable 		  " syntax highlighting
filetype plugin indent on " turns on 'detection', 'plug-in' and 'indent'
packadd! matchit          " load Vim's matchit plugin

set confirm               " dialogue when an operation has to be confirmed
set visualbell t_vb=      " visual bell instead of beeping
set mouse=a               " enable use of the mouse for all modes
set notimeout ttimeout ttimeoutlen=100 " quickly time out on keycodes, but never time out on mappings (?)

set shortmess+=I          " do not show Vim standard startup message
set number relativenumber " show relative line numbers
set cursorline            " highlight current line
set laststatus=2          " always display the status line
set showcmd               " show command in bottom bar
set ruler                 " show line and column number of cursor position
set cmdheight=2           " number of screen lines to use for command-line
set scrolloff=1           " vertical scroll offset
set sidescrolloff=5       " horizontal scroll offset
set linebreak             " wrap text at full words
set showbreak=@           " characters indicating line wrapping
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$ " invisibles

set hlsearch              " highlight matches
set incsearch             " search results are highlighted while typing
set showmatch             " highlight matching brackets

set shiftwidth=4 softtabstop=4 expandtab " use 4 spaces instead of tabs
set autoindent            " indent from current line when starting a new line
set backspace=2           " backspace over autoindent/line break/start of insert
set smarttab
set smartindent

set wildmode=longest,list " bash-shell-like autocompletion
set history=1000          " last 1000 commands are recorded in command line (:)
set hidden                " makes it easier to create hidden buffers
set path+=./**            " :find looks for files in all subdirectories
set foldlevelstart=10     " open most folds by default
set foldmethod=indent     " fold based on indent level
set autoread              " automatically read external file changes
set wildignore+=*.swp,*.zip " patterns to ignore when expanding wildcards

set nostartofline         " keep horizontal cursor position when scrolling
set nrformats-=octal
set formatoptions+=j      " delete comment character when joining commented lines
set spelllang=en_gb       " standard language for spell checking
                          " --> other important languages:
                          "     - en_us : USA
                          "     - de_20 : new German spelling

set background=dark       " always use dark mode
colorscheme gruvbox       " standard colorscheme
" ----------
set textwidth=0
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" ---------- GENERAL KEY REMAPPING ----------

let mapleader = ","
noremap \ ,

" exporting files with pandoc
nmap <C-e><C-p> :!$HOME/.vim/my_scripts/pandoc_markdown_to_pdf.sh %<CR>
nmap <C-e><C-b> :!$HOME/.vim/my_scripts/pandoc_markdown_to_beamer.sh %<CR>

" turn off search highlight:
nnoremap <silent> <leader><space> :nohlsearch<CR>

" toggle for showing invisibles (tabs, carriage returns, ...)
nnoremap <silent> <leader>l :set list!<CR>

" toggle spell checking on and off
nmap <silent> <leader>s :set spell!<CR>

" shortcut to edit vimrc
nmap <leader>v :e $MYVIMRC<CR>

" shortcut to edit vimrc
nmap <leader>b :e $HOME/.bashrc<CR>

" map <leader>v in command-line mode to replace the commandline with the Ex command-line beneath the cursor in the buffer
cnoremap <leader>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>

" source vimrc
nnoremap <F2> :source $MYVIMRC<CR>

" toggle paste-option
set pastetoggle=<F11>

" move by VISUAL line, wrapped lines treated as two lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap $ g$
nnoremap g$ $
nnoremap 0 g0
nnoremap g0 0
nnoremap ^ g^
nnoremap g^ ^

" FOR GERMAN KEYBOARD: Map "ö" to ";" (flip through character search commands)
nnoremap ö ;
nnoremap ä ,

" highlight last inserted text:
nnoremap gV `[v`]

" in Vims COMMAND-LINE PROMPT: typing %% automatically expands to path of active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" execute the current line of text as a shell command ==> REALLY COOL! :)
noremap Q !!$SHELL<CR>

" shortcuts for navigating between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" space open/closes folds
nnoremap <space> za

" inoremap kj <esc>

" remove entire word with <C-BS> in insert mode
inoremap <C-BS> <C-w>

" copy & paste to clipboard with <C-c> and <C-v>
vmap     <C-c> "+y
inoremap <C-v> <C-r>+

inoremap <C-Del> <C-o>daw

" ---------- ABBREVIATIONS ----------
" abbreviation
iabbrev atm at the moment
iabbrev tmr tomorrow

" autocorrect
iabbrev teh the

" ---------- SOURCE PRIVATE SETTINGS ----------

" source if file exists
function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

call SourceIfExists("~/.MyDotfiles/dotfiles.priv/vimrc.priv")

