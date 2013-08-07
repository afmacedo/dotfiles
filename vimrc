syntax on

set background=dark
colorscheme torte

set showmatch

"set tabstop=4|set shiftwidth=4|set expandtab | set smarttab


autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab | set smarttab
autocmd FileType xhtml,html set tabstop=2|set shiftwidth=2|set expandtab | set smarttab
autocmd FileType css set tabstop=4|set shiftwidth=4|set expandtab | set smarttab

au BufRead,BufNewFile *.dat set tabstop=4|set shiftwidth=4|set expandtab | set smarttab

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.c,*.h,*.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.c,*.h,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"set noautoindent

"set mouse=a
set hlsearch

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

:nmap <C-t> :tabnew<cr>
 	
" Navegacao nas tabs
:nmap <A-Left> :tabprevious<cr>
:nmap <A-Right> :tabnext<cr>


" Open PDF files
autocmd BufReadPre *.pdf set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78

" Pylint
"autocmd FileType python compiler pylint
"autocmd BufReadPost quickfix map <buffer> <silent> <CR> :.cc <CR> :ccl

" tag list
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1


" auto complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
inoremap <Nul> <C-x><C-o>

set bs=2

" Pathogen
execute pathogen#infect()
filetype plugin indent on

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
cabbrev nt NERDTreeToggle<CR>
let NERDTreeShowHidden=1
