

" Save file on losing focus (i.e. tabbing out) 
autocmd FocusLost * :wa


" Disable spell checking in quickfix
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal nospell
augroup END


augroup GitCommit
  autocmd!
  " Enable spellcheck for git commit messages
  autocmd FileType gitcommit setlocal spell
  
  " Disable gutentags when editing a commit message
  autocmd FileType gitcommit,gitrebase let g:gutentags_enabled=0
augroup END

" Make vim edit crontab
augroup AutoBackup
	autocmd!
	autocmd filetype crontab setlocal nobackup nowritebackup
augroup END

" Return to last edit position when opening files (You want this!)
augroup ReturnToLastPosition
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Automatically resize splits when host window is resized
augroup Misc
  autocmd!
  autocmd VimResized * exe "normal! \<c-w>="
augroup END


augroup AutoLatex
	autocmd!
	" autocmd FileType tex syntax match LatexCommand +\\[0-9A-Za-z_@]*+ contains=@NoSpell 
	autocmd FileType tex setlocal spell
	autocmd FileType tex silent call SetWrap()
	autocmd FileType tex setlocal foldenable foldmethod=marker foldlevel=1 
	autocmd FileType tex let &l:foldmarker="%{{{,%}}}"
	autocmd FileType tex setlocal textwidth=80
	autocmd FileType tex setlocal colorcolumn=80
    " autocmd FileType tex let b:AutoPairs = AutoPairsDefine({'\(' : '\)', '\[' : '\]'})
augroup END

augroup MyStandardAu
  autocmd!

  " Don't insert comment lead character when pressing o.
  autocmd FileType * set formatoptions-=o

  " Highlighting trailing whitespace.
  " autocmd BufWinEnter * let w:twsm=matchadd('TrailingWhiteSpace', '\s\+$')
augroup END



