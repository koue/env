syntax on
set number
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
function! LoadTemplate()
  silent! 0r ~/.vim/skel/tmpl.%:e
  " Highlight %VAR% placeholders with the Todo colour group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction
autocmd! BufNewFile * call LoadTemplate()
autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge

set colorcolumn=79
set cursorline
highlight ColorColumn ctermbg=7
"
" Highlight extra whitespaces
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"
" netrw
" refs: /usr/local/share/vim/vim[version]/doc/pi_netrw.txt
" 	/usr/local/share/vim/vim[version]/doc/eval.txt
"
" quit if only netrw window exists
autocmd bufenter * if (winnr('$') == 1 && bufexists("NetrwTreeListing"))  | q | endif
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
" open netrw window in the right side
  autocmd VimEnter * :Lexplore!
" move the cursor to the left window
  autocmd VimEnter * :wincmd h
augroup END
