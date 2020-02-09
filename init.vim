
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"        _   _       _                  _____             __ _               "
"       | \ | |     (_)                / ____|           / _(_)              "
"       |  \| |_   ___ _ __ ___       | |     ___  _ __ | |_ _  __ _         "
"       | . ` \ \ / / | '_ ` _ \      | |    / _ \| '_ \|  _| |/ _` |        "
"       | |\  |\ V /| | | | | | |     | |___| (_) | | | | | | | (_| |        "
"       |_| \_| \_/ |_|_| |_| |_|      \_____\___/|_| |_|_| |_|\__, |        "
"                                                               __/ |        "
"                                                              |___/         "
"                                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The above ASCII art is generated using service provided in this webpage:
" http://tinyurl.com/y6szckgd.

"{ Header and Licence
"{{ header info
" Description: 
" Author: Conturing
" Email: 
"}}

"{{ License: MIT License
"
" Copyright (c) 2020
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to
" deal in the Software without restriction, including without limitation the
" rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
" sell copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.
"}}
"}

"{ Main configurations
let g:is_win = has('win32') || has('win64')
let g:is_linux = has('unix') && !has('macunix')
let g:is_mac = has('macunix')


let g:nvim_config_root = expand('<sfile>:p:h')

let g:config_file_list = ['variables.vim',
    \ 'options.vim',
    \ 'autocommands.vim',
    \ 'mappings.vim',
    \ 'plugins.vim',
    \ 'ui.vim'
    \ ]

for s:fname in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . s:fname
endfor
"}

"{ List of related resources 
" - https://github.com/jdhao/nvim-config
" - https://github.com/gkapfham/dotfiles/blob/master/.vimrc
" - https://castel.dev/post/lecture-notes-1/
" - http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" - https://sanctum.geek.nz/arabesque/vim-anti-patterns/
" - https://google.github.io/styleguide/vimscriptguide.xml
"}





