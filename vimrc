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
