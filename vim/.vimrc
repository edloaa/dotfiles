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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

" snipptes and completion
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
let g:syntastic_python_python_exec = 'python3'

" VIM-UNIMPAIRED
" bubble single lines
nmap <C-Up>   [e
nmap <C-Down> ]e
" bubble multiple lines
vmap <C-Up>   [egv
vmap <C-Down> ]egv

" VIMTEX
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

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" TABULAR
" ==> see mapping section

" JEDI-VIM
let g:jedi#use_splits_not_buffers = "right"

" FZF
nnoremap <C-p> :<C-u>FZF<CR>

" ---------- BASIC SETTINGS ----------

set encoding=utf-8        " standard character encoding
set shell=/bin/bash       " standard shell
syntax enable 		  " syntax highlighting

if ! has("nvim")
    filetype plugin indent on " turns on 'detection', 'plug-in' and 'indent'
    packadd! matchit          " load Vim's matchit plugin
    set showcmd               " show command in bottom bar
    set ruler                 " show line and column number of cursor position
    set hlsearch              " highlight matches
    set incsearch             " search results are highlighted while typing
    set autoindent            " indent from current line when starting a new line
    set backspace=2           " backspace over autoindent/line break/start of insert
    set smarttab
    set autoread              " automatically read external file changes
endif

set confirm               " dialogue when an operation has to be confirmed
set visualbell t_vb=      " visual bell instead of beeping
set mouse=a               " enable use of the mouse for all modes
set notimeout ttimeout ttimeoutlen=100 " quickly time out on keycodes, but never time out on mappings (?)

set shortmess+=I          " do not show Vim standard startup message
set number relativenumber " show relative line numbers
set cursorline            " highlight current line
set laststatus=2          " always display the status line
set cmdheight=2           " number of screen lines to use for command-line
set scrolloff=1           " vertical scroll offset
set sidescrolloff=5       " horizontal scroll offset
set linebreak             " wrap text at full words
set showbreak=@           " characters indicating line wrapping
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$ " invisibles

set showmatch             " highlight matching brackets
set shiftwidth=4 softtabstop=4 expandtab " use 4 spaces instead of tabs
set smartindent

set wildmode=longest,list " bash-shell-like autocompletion
set history=1000          " last 1000 commands are recorded in command line (:)
set hidden                " makes it easier to create hidden buffers
set path+=./**            " :find looks for files in all subdirectories
set foldlevelstart=10     " open most folds by default
set foldmethod=indent     " fold based on indent level
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

set splitright " vsplit to the right side

" ---------- GENERAL KEY REMAPPING ----------

let mapleader = ","
noremap \ ,

" exporting files with pandoc
command! PandocExportMarkdown2Pdf    w | !$HOME/.vim/my_scripts/pandoc_markdown_to_pdf.sh %
command! PandocExportMarkdown2Beamer w | !$HOME/.vim/my_scripts/pandoc_markdown_to_beamer.sh %
nmap <leader>ep :PandocExportMarkdown2Pdf <CR>
nmap <leader>eb :PandocExportMarkdown2Beamer <CR>

" 'git status' (VIM-FUGITIVE)
nmap <silent> <leader>gs :Gstatus <CR>

command! GitReviewAndPush !terminator -e "$HOME/.vim/my_scripts/git_review_and_push.sh"
nmap <silent> <leader>gp :GitReviewAndPush <CR>

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

" open terminal buffer
nmap <leader>t :vsplit <Bar> terminal<CR>

" map <leader>v in command-line mode to replace the commandline with the Ex command-line beneath the cursor in the buffer
cnoremap <leader>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>

" ROT13 the entire file
nmap <leader>c ggg?G

" source vimrc
nnoremap <F2> :source $MYVIMRC<CR>

" toggle paste-option
set pastetoggle=<F11>

" move through buffer list
nmap <silent> <C-Right> :bnext<CR>
nmap <silent> <C-Left>  :bprevious<CR>
nmap <silent> <C-Del>   :bdelete<CR>

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

nnoremap  <Up>   g<Up>
nnoremap g<Up>    <Up>
nnoremap  <Down> g<Down>
nnoremap g<Down>  <Down>

" " move by VISUAL line, wrapped lines treated as two lines in INSERT MODE too
" " ----- Mapping interferes with auto-completion list -----
" inoremap <Up>   <C-o>g<Up>
" inoremap <Down> <C-o>g<Down>

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

" remove entire word with <C-BS> in insert mode
inoremap <C-BS> <C-w>

" copy & paste to clipboard with <C-c> and <C-v>
vmap     <C-c> "+y
inoremap <C-v> <C-r>+

inoremap <C-Del> <C-o>daw

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR>  {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" TABULAR
" mappings from http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>a# :Tabularize /#<CR>
vmap <leader>a# :Tabularize /#<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
" END: TABULAR

" Compress whitespace in a visual selection
"   --> Replace two or more '{2,}' whitespaces '\s' with a single space
"       character, but only if preceded '\@<=' by one or more non-whitespace
"       characters '\S'
"   --> For instance useful to convert THIS:
"
"        foo   =      1729
"        bar  =   42
"
"       ... TO THIS:
"
"        foo = 1729
"        bar = 42
"
vmap <F5> :s/\(\S\+\)\@<=\s\{2,\}/ /g<CR>

" ---------- SOURCE ADDITIONAL CONFIG FILES ----------

" source if file exists
function! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfunction

" private settings
call SourceIfExists("~/.vimrc_priv")

" abbreviations and autocorrect
call SourceIfExists("~/.vim/my_config/abbreviations.vim")

