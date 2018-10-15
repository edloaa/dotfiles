" ---------- GENERAL KEY REMAPPING ----------

" NORMAL MODE
" VISUAL MODE
" INSERT MODE
" COMMAND MODE
" TERMINAL MODE

let mapleader = ","
noremap \ ,

" --------------------------------------
" ---------- GENERAL MAPPINGS ----------
" --------------------------------------

" Moving through buffer list
nmap <silent> <C-Right> :bnext<CR>
nmap <silent> <C-Left>  :bprevious<CR>
nmap <silent> <C-Del>   :bdelete<CR>

" Navigating between split windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Remove entire words in insert mode (backwards and forward)
inoremap <C-BS> <C-w>
inoremap <C-Del> <C-o>daw

" Copy & paste to clipboard with <C-c> and <C-v>
vmap     <C-c> "+y
inoremap <C-v> <C-r>+

" (Plugin) VIM-UNIMPAIRED
" Bubble single lines
nmap <C-Up>   [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up>   [egv
vmap <C-Down> ]egv

" (Plugin) NERDTREE
map <silent> <C-n> :NERDTreeToggle<CR>

" (Plugin) FZF
nnoremap <C-p> :<C-u>FZF<CR>

" Move by VISUAL line (wrapped lines treated as separate lines)
nnoremap  j gj
nnoremap gj  j
nnoremap  k gk
nnoremap gk  k
nnoremap  $ g$
nnoremap g$  $
nnoremap  0 g0
nnoremap g0  0
nnoremap  ^ g^
nnoremap g^  ^
nnoremap  <Up>   g<Up>
nnoremap g<Up>    <Up>
nnoremap  <Down> g<Down>
nnoremap g<Down>  <Down>

" " Move by VISUAL line in INSERT MODE too
" " ----- Mapping interferes with auto-completion list -----
" inoremap <Up>   <C-o>g<Up>
" inoremap <Down> <C-o>g<Down>

" FOR GERMAN KEYBOARD: Use "ö" and "ä" to flip through character searches
nnoremap ö ;
nnoremap ä ,

" Highlight last inserted text
nnoremap gV `[v`]

" In Vims command-line prompt: typing %% automatically expands to path of active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Execute the current line of text as a shell command ==> REALLY COOL! :)
noremap Q !!$SHELL<CR>

" Space open/closes folds
nnoremap <space> za

" Create pairing brackets in insert mode
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR>  {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" -------------------------------------------
" ---------- FUNCTION KEY MAPPINGS ----------
" -------------------------------------------

" Source vimrc
nnoremap <F2> :source $MYVIMRC<CR>

" (Plugin) VIM-OBSESSION
nnoremap <F3> :Obsession<CR>

" (Plugin) STRIP-TRAILING-WHITESPACE
nnoremap <F5> :FixWhitespace<CR>

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
vmap <F5> :s/\(\S\+\)\@<=\s\{2,\}/ /g<CR>

" Toggle paste-option
set pastetoggle=<F11>

" -----------------------------------------
" ---------- LEADER KEY MAPPINGS ----------
" -----------------------------------------

" (Plugin) TABULAR
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>a# :Tabularize /#<CR>
vmap <leader>a# :Tabularize /#<CR>

" Shortcut to edit vimrc
nmap <leader>b :e $HOME/.bashrc<CR>

" ROT13 the entire file
nmap <leader>c ggg?G

" Exporting files with pandoc
command! PandocExportMarkdown2Pdf    w | !$HOME/.vim/my_scripts/pandoc_markdown_to_pdf.sh %
command! PandocExportMarkdown2Beamer w | !$HOME/.vim/my_scripts/pandoc_markdown_to_beamer.sh %
nmap <leader>ep :PandocExportMarkdown2Pdf <CR>
nmap <leader>eb :PandocExportMarkdown2Beamer <CR>

" --- Git mappings ---
" (Plugin) VIM-FUGITIVE: 'git diff' and 'git status'
nmap <silent> <leader>gd :Gdiff <CR>
nmap <silent> <leader>gs :Gstatus <CR>
" Review and push a repository
command! GitReviewAndPush !terminator -e "$HOME/.vim/my_scripts/git_review_and_push.sh"
nmap <silent> <leader>gp :GitReviewAndPush <CR>

" Toggle for showing invisibles (tabs, carriage returns, ...)
nnoremap <silent> <leader>l :set list!<CR>

" Toggle spell checking on and off
nmap <silent> <leader>s :set spell!<CR>

" Open terminal buffer
nmap <leader>t :vsplit <Bar> terminal<CR>

" Read templates
cnoremap <leader>t -1 read ~/.templates/

" Shortcut to edit vimrc
nmap <leader>v :e $MYVIMRC<CR>

" Map <leader>v in command-line mode to replace the commandline with the Ex command-line beneath the cursor in the buffer
cnoremap <leader>v <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>

" Turn off search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" --------------------------------------
" ---------- SPECIAL MAPPINGS ----------
" --------------------------------------

" (Plugin) TABULAR
" Auto-align table separated by pipe
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

