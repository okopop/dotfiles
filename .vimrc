" Use filetype detection and file-based automatic indenting
filetype plugin indent on

set shiftwidth=2   " Indents will have a width of 2
set tabstop=4      " TAB width is set to 4, 'softtabstop' has this default value
set expandtab      " Expand TABs to spaces

" yaml
autocmd! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Highlight trailing whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
