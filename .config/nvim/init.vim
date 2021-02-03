call plug#begin('~/.config/nvim/plugged')
"JavaScript
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'itchyny/lightline.vim'


Plug 'ryanoasis/vim-devicons'
call plug#end()

"Javascript


""NERDTree Settings

nnoremap ,c "+y 
"" increament
nnoremap ,i p<C-a>Y  


"minimal ui
let NERDTreeMinimalUI=1


"close if only NT is the only open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"open NT when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"open NT when specifie a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"toggle NT with <C-n>
map <C-n> :NERDTreeToggle<CR>

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1


let g:DevIconsDefaultFolderOpenSymbol='' " symbol for open folder (f07c)
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol='' " symbol for closed folder (f07b)


let g:NERDTreeStatusline = -1 
""End NERDTree Settings

"" light status bar
"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch'
      \ },
      \ }

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD")
endfunction

""common

"split navigation re-map
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <C-M-h> <C-w><
nmap <C-M-j> <C-w>+
nmap <C-M-k> <C-w>-
nmap <C-M-l> <C-w>>



syntax on
set number
set backspace=indent,eol,start

set arabicshape!
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set encoding=UTF-8
set fillchars=""
hi VertSplit cterm=none

command! -nargs=* Runc  :w | :! gcc % -o %:r  && ./%:r <f-args>
command! -nargs=* Debugc :w | :! cc -g --std=c99 -Wall -fsanitize=address % -o %:r && gdb ./%:r <q-args>
command! -nargs=* Debugctui :w | :! cc -g --std=c99 -Wall -fsanitize=address % -o %:r && gdb ./%:r <q-args>
