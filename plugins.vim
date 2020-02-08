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

call plug#begin(g:PLUGIN_HOME)

" Show contents of registers when typing " or @ or <Ctrl-R>
Plug 'junegunn/vim-peekaboo'


Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Tagbar 
Plug 'liuchengxu/vista.vim'

" Easy alignment
Plug 'junegunn/vim-easy-align'

" Add movements for CamelCase and _ (underscore)
" useful for programming
Plug 'bkad/CamelCaseMotion', {'for': ['java', 'cpp', 'rust']}

" Testing this one, maybe too much?
Plug 'KeitaNakamura/highlighter.nvim', {'for': ['python', 'cpp']}

Plug 'tweekmonster/braceless.vim', {'for': ['python']}

call plug#end()
"}

autocmd FileType python BracelessEnable +indent +fold +highlight

" CamelCase motion with w
map <silent> w <Plug>CamelCaseMotion_w

" Toggle Limelight on Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Fzf
nnoremap <Tab> :Buffers <CR>

" Navigate to the next linting warning/error
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign) 

" Perform highlighting asynchronously when file is loaded or saved
let g:highlighter#auto_update = 2


augroup Latex
  " When linting is costly in LaTeX, only perform it in normal mode
  autocmd Filetype tex call SetLatexLintingOptions()
  function! SetLatexLintingOptions()
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_delay = 500
    let g:ale_lint_on_enter = 0
  endfunction
augroup END



