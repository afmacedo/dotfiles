syntax on

set t_Co=256

set background=dark
"colorscheme torte
colorscheme easyballs

set showmatch
set ruler

" set tabstop=4 | set shiftwidth=4 | set expandtab | set smarttab

autocmd FileType python,py set tabstop=4 | set shiftwidth=4 | set expandtab | set smarttab | colorscheme torte
autocmd FileType js set tabstop=4 | set shiftwidth=4 | set expandtab | set smarttab | softtabstop=4
autocmd FileType xhtml,html set tabstop=2 | set shiftwidth=2 | set expandtab | set smarttab
autocmd FileType css set tabstop=4 | set shiftwidth=4 | set expandtab | set smarttab | colorscheme torte
autocmd FileType yml,yaml set tabstop=2 | set shiftwidth=2 | set expandtab | set smarttab

au BufRead,BufNewFile *.dat set tabstop=4|set shiftwidth=4|set expandtab | set smarttab

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.c,*.h,*.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.c,*.h,*.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set noautoindent

"set mouse=a
set hlsearch

set foldmethod=indent
set foldlevel=100
nnoremap <space> za
vnoremap <space> zf

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
"filetype plugin indent on

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
cabbrev nt NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Javascript
let javascript_enable_domhtmlcss = 1

" Python
let python_highlight_all = 1 

" Print line for Column 80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Print line numbers
" set nu
