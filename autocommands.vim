

" Save file on losing focus (i.e. tabbing out) 
autocmd FocusLost * :wa


" Disable spell checking in quickfix
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal nospell
augroup END


augroup GitCommit
  " Enable spellcheck for git commit messages
  autocmd FileType gitcommit setlocal spell
  
  " Disable gutentags when editing a commit message
  autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0
augroup END


