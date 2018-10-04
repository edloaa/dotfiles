"  ________
" < neovim >
"  --------
"   \
"    \   \_\_    _/_/
"     \      \__/
"            (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

source ~/.vimrc

" ---------- NEOVIM SPECIFIC ----------
set inccommand=split

" Terminal mode
" <Esc> to exit terminal mode
" <C-v><Esc> (mnemonic: verbatim escape) to send escape key to shell
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

highlight! link TermCursor Cursor
highlight! TermCursorNC guibg=green guifg=white ctermbg=10 ctermfg=15

