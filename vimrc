set nocompatible
set autoindent
set mouse=a
set ignorecase
set paste
set tabstop=4
set directory=/tmp
set backupdir=/tmp
filetype on
filetype plugin on
filetype indent on

" цветовая схема
let g:zenburn_high_Contrast = 1
colorscheme zenburn

set nu!
set grepprg=grep\ -nH\ $*
set pastetoggle=<F5>

set guifont=Courier\ New\ 10

let g:pyindent_open_paren = 4
let g:pyindent_nested_paren = 4
let g:pyindent_continue = 4
let python_highlight_all = 1

let g:snippetsEmu_key = "<C-l>"

let g:NERDShutUp = 1

"map <F5> :wa^V^M:make^V^M
"map <F6> :cope^V^M
"map <F7> :cp^V^M
"map <F8> :cn^V^M

"let b:encindex=0

:hi CursorLine   cterm=NONE ctermbg=darkyellow ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

au BufNewFile,BufRead *.c
    \ inoremap { {<CR>}<Esc>O
