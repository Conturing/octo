

" case insensitive search
set ignorecase
set smartcase
set infercase

" search
set hlsearch
set incsearch

" search in current directory
set path+=**
set path+=src/

" indentation
set autoindent
" smartindent should not be used, instead use autoindent + filetype plugin indent on
" set smartindent 

" tabs
function! NoexpandTabs(tabstop) abort 
	setlocal noexpandtab
	let &l:tabstop=a:tabstop
	let &l:softtabstop=a:tabstop
	let &l:shiftwidth=a:tabstop
	setlocal smarttab
endfunction

function! ExpandTabs(tabstop) abort 
	setlocal expandtab
	let &l:tabstop=8
	let &l:softtabstop=a:tabstop
	let &l:shiftwidth=a:tabstop
	setlocal smarttab
	"Round indent to nearest shiftwidth multiple
	setlocal shiftround
endfunction

silent call NoexpandTabs(4)

" Hide buffers when they are abandoned
set hidden

" Automatically save before commands like :next and :make
set autowrite

" Automatically read file when changed externally 
set autoread

" Clipboard
set clipboard+=unnamed

" Configure backspace so it acts as it should
set backspace=eol,start,indent

" Display goes to the next line when at line end and entering one of
" left/right/h/l
set whichwrap+=<,>,h,l,[,]

set complete+=kspell

" Do not add two spaces when joining '.' etc.
set nojoinspaces

" wildmenu
set wildmode=longest,full
set wildmenu
set wildignorecase

" ignore compiled files
set wildignore=*.o,*.pyc,*.out,*.obj,*.rbc,*.rbo,*.class
" ignore backups
set wildignore+=*.bak,*.swp,*~
" ignore archives
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" ignore libs, media files etc
set wildignore+=*/tmp/*,*.so,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.ico,*.pdf,*.wav,*.mp4,*.mp3
" ignore latexmk clutter (most of the time these files just spam the menu)
set wildignore+=*.bbl,*.blg,*.dvi,*.fdb_latexmk,*.fls,*.xdv,*.aux
" ignore versioning tools
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" for regex
set magic


" increase synching (slow)
syn sync maxlines=2000
syn sync minlines=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tagcase=smart
set tags+=$HOME/dev/tags/gtkmm-3.0.tags,./tags,tags;$HOME


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=marker
set foldnestmax=10
set nofoldenable
set foldlevel=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" jump to matching brackets for 4/10-th of a second
set showmatch
set matchtime=4

" show command in status line.
set showcmd
set noshowmode

" line numbers
" set relativenumber " relative to current line (slow)
set number  " absolute

" keep distance while scrolling
set scrolloff=7
set sidescroll=5

" show special characters
" set list
set listchars=
set listchars+=tab:\ \ 
set listchars+=trail:¬
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:␣

" wrap
" set wrap		" break at the width of the window
" set linebreak	" break at word boundary
let &showbreak = '+++ '

function! ToggleWrap()
  if &wrap
	call UnsetWrap()
  else
	call SetWrap()
  endif
endfunction

function! SetWrap()
  echo "Wrap ON"
  setlocal wrap linebreak nolist
  set virtualedit=
  setlocal display+=lastline
  call WrapNavigation()
endfunction

function! UnsetWrap()
  echo "Wrap OFF"
  setlocal nowrap
  set virtualedit=all
  call WrapNavigation()
endfunction

function! WrapNavigation()
  if &wrap
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  else
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  endif
endfunction

" default wrap
silent call SetWrap()

" Enable mouse usage (all modes)
set mouse=a

set nosplitbelow splitright

set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set utf8 as standard encoding 
set encoding=utf8

"set autochdir

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    let &undodir=expand(g:nvim_config_root.'/temp_dirs/undodir')
    set undofile
catch
endtry

set undolevels=5000


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	
" set spelllang=hun-de-DE-frami,en
set spelllang=en

let &spellfile=expand(g:nvim_config_root.'/spell/en-de.utf-8.add')

if &diff
	set nospell
endif

