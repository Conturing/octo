
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! MySpellingHighlights() abort
	highlight clear SpellBad
	highlight SpellBad cterm=underline ctermfg=red
	highlight clear SpellRare
	highlight SpellRare cterm=underline
	highlight clear SpellCap
	highlight SpellCap cterm=underline
	highlight clear SpellLocal
	highlight SpellLocal cterm=underline
endfunction

augroup AutoHiSpelling
	autocmd!
	autocmd ColorScheme * call MySpellingHighlights()
augroup END

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    "set t_Co=256
    set guitablabel=%M\ %t
endif

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
"set t_Co=256

"set background=dark
try
	colorscheme solarized
catch
endtry

" reminder to keep characters per line to a sane value
"set colorcolumn=140
"highlight ColorColumn ctermbg=darkgray

" highlight cursor (slow)
" set cursorline
highlight CursorLine cterm=none ctermbg=black guibg=darkred


" use the same color for gutter
highlight clear SignColumn
