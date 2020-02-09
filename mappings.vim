"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
vnoremap <C-c> "+yy
" noremap  <buffer> <silent> <Up> gk
" noremap  <buffer> <silent> <Down> gj

" control + direction to change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

set pastetoggle=<C-z>

nnoremap <C-u> :redo

" macros qq -> record, q -> end, Q -> execute
nnoremap Q @q
vnoremap Q :norm @q<cr>

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" Source (n)vimrc
nnoremap <F1> :w<CR>:source $MYVIMRC<CR>
inoremap <F1> <ESC>:w<CR>:source $MYVIMRC<CR>i

" open Undotree side panel
nnoremap <F5> :UndotreeToggle<cr>

" search text from clipboard 
nnoremap <C-f> ?<C-r>+<CR>

" clear search pattern -> no highlighting
"nnoremap <Space> :let @/=""<CR>

" Toggle fold
nnoremap <Space> za

nnoremap <C-y> 0f\df}?begin$pdd

function! LatexReplaceLabel()
    execute "normal! 0f\df}?begin$pdd"
endfunction

function! LatexFixMath() abort
	execute "normal! 0f$xxi\<Esc>f$xxi\]<Esc>"
endfunction

nnoremap <C-Shift-ddf> :%s/\([.?!]\)[[:blank:]]\{1,\}\([^[:blank:]]\)/\1\2/gc 

" I am too lazy to take my hands from shift
command! WQ wq
command! Wq wq
command! W w

" Search will center on the line it's found in
nnoremap N Nzz
nnoremap n nzz

" Correct spelling mistakes with Ctrl-L
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Disable the arrow keys
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
