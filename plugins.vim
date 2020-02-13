"{ Plugin installation
"{{ Vim-plug Install and related settings

" Auto-install vim-plug on different systems if it does not exist.
" For Windows, only Windows 10 with curl installed are supported (after
" Windows 10 build 17063, source: http://tinyurl.com/y23972tt).
" The following script to install vim-plug is adapted from vim-plug
" wiki: https://github.com/junegunn/vim-plug/wiki/tips#tips
let g:VIM_PLUG_PATH = expand(g:nvim_config_root . '/autoload/plug.vim')
if executable('curl')
    if empty(glob(g:VIM_PLUG_PATH))
        echomsg 'Installing Vim-plug on your system'
        silent execute '!curl -fLo ' . g:VIM_PLUG_PATH . ' --create-dirs '
            \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        augroup plug_init
            autocmd!
            autocmd VimEnter * PlugInstall --sync | quit |source $MYVIMRC
        augroup END
    endif
else
    echoerr 'You have to install curl to install vim-plug, or install '
            \ . 'vim-plug by yourself.'
    finish
endif

let g:PLUGIN_HOME=expand(g:nvim_config_root . '/plugged')
" let g:PLUGIN_HOME=expand(stdpath('data') . '/plugged')
"}}

let g:ale_sign_highlight_liners = 1

call plug#begin(g:PLUGIN_HOME)

" Show contents of registers when typing " or @ or <Ctrl-R>
Plug 'junegunn/vim-peekaboo'

" Suround things with ys
Plug 'tpope/vim-surround'

" Create comments on multiple lines with gc 
Plug 'tpope/vim-commentary'

" Tags
Plug 'ludovicchabant/vim-gutentags'
" Plug 'ludovicchabant/vim-gutentags', { 'for' : ['tex', 'latex', 'haskell', 'c', 'cpp', 'rust', 'python', 'java'] }

" Tagbar 
Plug 'liuchengxu/vista.vim', { 'for' : ['tex', 'latex', 'haskell', 'c', 'cpp', 'rust', 'python', 'java'] }

" Undotree
Plug 'mbbill/undotree'

" Filesystem view
Plug 'scrooloose/nerdtree'

" Auto completion (--system-libclang for archlinux)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang', 'frozen' : 1 }

Plug 'junegunn/fzf.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" Syntax checking
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'

" Auto close delimiters
Plug 'Raimondi/delimitMate'

" Focus
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Start screen
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" Fancy ruler
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

" Easy alignment
Plug 'junegunn/vim-easy-align'


" Colorschemes
" Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

" Improve vim incsearch, clear search highlight automatically
Plug 'haya14busa/is.vim'
" Plug 'PeterRincker/vim-searchlight'

" Stay after pressing * and search selected text
Plug 'haya14busa/vim-asterisk'

Plug 'terryma/vim-multiple-cursors'

"{{ Prose

Plug 'tpope/vim-abolish'

Plug 'reedes/vim-pencil', { 'for': ['tex', 'mardown', 'text'] }

Plug 'dpelle/vim-LanguageTool', { 'for': ['tex', 'mardown', 'text'] }

"}}


"{{ Programming

" Add movements for CamelCase and _ (underscore)
" useful for programming
Plug 'bkad/CamelCaseMotion', {'for': ['java', 'cpp', 'rust']}

" extends %
Plug 'andymass/vim-matchup'

" Testing this one, maybe too much?
Plug 'KeitaNakamura/highlighter.nvim', {'for': ['python', 'cpp']}

" C++
"highlights std:: and similar stuff
Plug 'bfrg/vim-cpp-modern', { 'for' : ['c', 'cpp'] }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for' : ['haskell'] }
Plug 'alx741/vim-hindent', { 'for' : ['haskell'] }

" Rust
Plug 'rust-lang/rust.vim', { 'for' : ['rust'] }

" LaTeX
Plug 'lervag/vimtex', { 'for' : ['tex', 'latex'] }
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" Python
Plug 'tmhedberg/SimpylFold', { 'for' : ['python'] }
Plug 'davidhalter/jedi-vim', {'for': ['python'] }
Plug 'tweekmonster/braceless.vim', {'for': ['python']}

" R
Plug 'jalvesaq/Nvim-R', {'for': 'r'}
"}}

" get . (dot) for plugin mappings
Plug 'tpope/vim-repeat'

" mostly for [l, ]l for :lnext
Plug 'tpope/vim-unimpaired'

" plug#end implicitly calls the following:
"  -> filetype plugin indent on
"  -> syntax enable
" DO NOT set these again, it may override system settings
call plug#end()

"}

autocmd FileType python BracelessEnable +indent +fold +highlight

" CamelCase motion with w
map <silent> w <Plug>CamelCaseMotion_w

" Toggle Limelight on Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = '10'
let g:limelight_paragraph_span = 1

let g:SimpylFold_docstring_preview = 1

let g:indent_guides_enable_on_vim_startup = 1

" Fzf
nnoremap <Tab> :Buffers <CR>

" Navigate to the next linting warning/error
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next_wrap)zt

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign) 

" Perform highlighting asynchronously when file is loaded or saved
let g:highlighter#auto_update = 2


"{{{ YCM

" most of these settings comply to the default

" show ui at the bottom with diagnostics (error,warnings,...)
let g:ycm_show_diagnostics_ui = 1
" symbols
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
" show icons in vim's gutter
let g:ycm_enable_diagnostic_signs = 1
" highlight diagnostics in current line
let g:ycm_enable_diagnostic_highlighting = 1
" echo current diagnostic message at the bottom
let g:ycm_echo_current_diagnostic = 1
" collect identifiers from ctags - use Exuberant Ctags with --fields=+l
let g:ycm_collect_identifiers_from_tags_files = 1
" use keywords of the programming language for completion
let g:ycm_seed_identifiers_with_syntax = 0
" every .ycm_extra_conf.py file in home directory can be trusted (can it?)
let g:ycm_extra_conf_globlist = ['~/*']
" limit suggestions to 8 entries (does *not* include identifier suggestions)
let g:ycm_max_num_candidates = 8
" limit suggestions from the identifier based engine to 8 (does not include semantic suggestions)
let g:ycm_max_num_identifier_candidates = 8
" activate ycm for the following filetypes
let g:ycm_filetype_whitelist = {'*': 1}
let g:ycm_filetype_blacklist = {
	\ 'tagbar': 1,
	\ 'notes': 1,
	\ 'markdown': 1,
	\ 'netrw': 1,
	\ 'unite': 1,
	\ 'text': 1,
	\ 'vimwiki': 1,
	\ 'pandoc': 1,
	\ 'infolog': 1,
	\ 'mail': 1 }
" dont spam the location list
let g:ycm_always_populate_location_list = 0
" close preview (*not* split view) after leaving insert mode 
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" close suggestions view with <C-y>
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = ''
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Tab>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<s-Tab>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-Space>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YCM vim support
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" let g:UltiSnipsExpandTrigger='<c-k>'
" let g:UltiSnipsJumpForwardTrigger='<c-k>'
" let g:UltiSnipsJumpBackwardTrigger='<c-s-k>'
" let plugDir='/home/max/.vim/bundle'
" let g:UltiSnipsSnippetsDir=plugDir.'/vim-snippets/UltiSnips'

"}}}

let g:vimtex_compiler_method='latexmk'
let g:tex_flavor='xelatex'
" let g:vimtex_compiler_latexmk='-pdfxe'
set conceallevel=2
let g:tex_conceal='abdmg'
let g:tex_comment_nospell=1

"{{{ ALE
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_open_list = 1
" do not continuously check the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_list_window_size = 7
" use quickfix instead of loclist
" Note: this does spam the quickfix list alot
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

augroup Latex
  " When linting is costly in LaTeX, only perform it in normal mode
  autocmd Filetype tex call SetLatexLintingOptions()
  function! SetLatexLintingOptions()
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_delay = 500
    let g:ale_lint_on_enter = 1
  endfunction
augroup END
"}}}

"{{{ Vista
" Enable the display of icons in the Vista interface
let g:vista#renderer#enable_icon = 1

" How each level is indented and what to prepend.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Configure how Vista shows a location when navigating its interface
let g:vista_echo_cursor_strategy = 'echo'

" Allow Vista to create data for display in the lightline (TODO)
let g:vista_disable_statusline = 0

" Define icon mappings for the cases when the defaults do not match
" Note that Vista defines "class" and "method" but not the plural
" Summary of the icon definitions:
" --> Java: classes, methods
" --> LaTeX: labels, sections, subsections, subsubsections
" --> VimScript: autocommand groups, commands, maps
" --> Default: use a box with a circle instead of question mark
let g:vista#renderer#icons = {
\   'S': "\uf7fd",
\   'c': "\uf7fd",
\   's': "\uf7fd",
\   'autocommand groups': "\uf136",
\   'classes': "\uf0e8",
\   'commands': "\uf8a3",
\   'labels': "\uf71b",
\   'maps': "\uf8a3",
\   'methods': "\uf6a6",
\   'sections': "\uf7fd",
\   'subsections': "\uf7fd",
\   'subsubsections': "\uf7fd",
\   'default': "\uf7fd",
\  }
"}}}

""""""""""""""""""""""""""""is.vim settings"""""""""""""""""""""""
" To make is.vim work together well with vim-anzu and put current match in
" the center of the window.
" `zz`: put cursor line in center of the window.
" `zv`: open a fold to reveal the text when cursor step into it.
nmap n <Plug>(is-n)zt
nmap N <Plug>(is-N)zt

map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)


" Force Jedi to use version 3
let g:jedi#force_py_version = 3

" Disable jedi-vim auto-completion and enable call-signatures options
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_command = ''
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = '1'
let g:jedi#smart_auto_mappings = 0



" Lightline for Status Line and Buffer Line {{{

" Always display the tabline so that lightline buffers can override
set showtabline=2

" Display icons in lightline buffer at screen top
let g:lightline#bufferline#enable_devicons = 1

" Do not shorten the path of a buffer
let g:lightline#bufferline#shorten_path = 1

" Do not show the buffer, as :b num nav not needed
let g:lightline#bufferline#show_number = 0

" Define a name of 'No Name' buffer
let g:lightline#bufferline#unnamed = '*'

" Configure the lightline according to documentation and examples from statico/dotfiles
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'spell', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'context', 'modified' ] ],
      \   'right': [['lineinfo'], ['percent'], ['linter_warnings', 'linter_errors', 'linter_ok', 'fileformat', 'fileencoding', 'filetype'], ['gutentags']]
      \ },
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'spell': 'LightlineSpell',
      \   'filetype': 'LightlineFiletype',
      \   'fileformat': 'LightlineFileformat',
      \   'filename': 'LightlineFilename',
      \   'gutentags': 'LightlineGutentags',
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK',
      \   'context': 'NearestMethodOrFunction'
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
\ }

" Ensure that the lightline status bar updates
augroup GutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END

" Display a diagnostic message when gutentags updates
function! LightlineGutentags()
  return gutentags#statusline() !=# '' ? '  Tags ' : 'Tags '
endfunction

" Display a lock symbol if the file is read-only (e.g., help files)
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" Display symbols, not dictionaries, to indicate that spell-checking runs
function! LightlineSpell()
  return &spell ? 'A-Z✔ ' : ''
endfunction

" Display file name with symbol or '*' for 'No Name'
function! LightlineFilename()
  return '' !=# expand('%:t') ? ' '.expand('%:t') : ' *'
endfunction

" Display the name of the branch with a specialize symbol
function! LightlineFugitive()
  if exists('*fugitive#head')
    let l:branch = fugitive#head()
    return l:branch !=# '' ? ' שׂ '.l:branch : ''
  endif
  return ''
endfunction

" Detect and display the file type, using a dev-icon
function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() . ' ' : 'no ft ') : ''
endfunction

" Detect and display the file format, using a dev-icon
function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) . ' ' : ''
endfunction

" Collect, count, and display the linter warnings from ale
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ', l:all_non_errors)
endfunction

" Collect, count, and display the linter errors from ale
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ', l:all_errors)
endfunction

" Since there are no warnings or errors, display a zero count
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '0   0 ' : ''
endfunction

" Update and show lightline but only if it's visible
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Update the lightline linting errors if it is enabled
augroup alecallconfiguration
  autocmd User ALELint call s:MaybeUpdateLightline()
augroup END

" Configure the lightline buffer listing at top of the screen
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['bufnum']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" }}}
