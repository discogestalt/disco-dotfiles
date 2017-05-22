filetype plugin on
filetype plugin indent on
set smartindent
set autoindent
set cpoptions=ces$
set ruler
set noshowmode
set textwidth=0
set nobackup
set shiftwidth=2
set ts=2
high Normal guifg=White guibg=Black
high Search guifg=Black
syntax on
high comment ctermfg=2

" turn off auto adding comments on next line
" " so you can cut and paste reliably
" " http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo=tcq
set nocompatible
set modeline

set tabstop=2
set expandtab
set softtabstop=2

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\	/
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
