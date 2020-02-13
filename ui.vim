
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! MySpellingHighlights() abort
	" highlight clear SpellBad
	" highlight SpellBad cterm=undercurl ctermfg=red guisp=undercurl guifg=red
	" highlight clear SpellRare
	" highlight SpellRare cterm=underline ctermbg=0 guisp=underline guibg=0
	" highlight clear SpellCap
	" highlight SpellCap cterm=undercurl ctermbg=0 guisp=undercurl guibg=0
	" highlight clear SpellLocal
	" highlight SpellLocal cterm=underline ctermbg=0 guisp=underline guibg=0
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

set termguicolors
set guifont=FiraCode\ 16

" reminder to keep characters per line to a sane value
"set colorcolumn=140
"highlight ColorColumn ctermbg=darkgray

" highlight cursor (slow-ish?)
set cursorline
set fillchars+=vert:│


function! ColumnLayout() abort
	highlight clear CursorLine
	highlight CursorLine cterm=none ctermbg=8 guibg=8
	highlight clear CursorLineNR
	highlight CursorLineNR cterm=bold ctermbg=0 ctermfg=14 guibg=0 guifg=14

	" use the same color for gutter
	highlight clear SignColumn
	highlight SignColumn cterm=none ctermbg=8 guibg=8

	highlight clear VertSplit
	highlight VertSplit ctermbg=0 guibg=0
endfunction

augroup AutoHiColumn
	autocmd!
	autocmd ColorScheme * call ColumnLayout()
augroup END


try
	colorscheme solarized8
catch
endtry
