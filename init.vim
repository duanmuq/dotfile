
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           NVIM Interface                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号
set number
" 显示光标当前位置
set ruler
" 高亮显示当前行
set cursorline
" 显示标题
set title
" 显示模式
set showmode
" 显示当前vim模式
set showcmd
set cmdheight=2
set hidden
" 开启语法高亮
syntax enable
" 允许用语法配色代替默认方案
syntax on

set scrolloff=5
set wildmenu

set textwidth=99
highlight ColorColumn ctermbg=LightGray guibg=LightGray

set t_Co=256
set termguicolors
set background=dark
set colorcolumn=80
" colorscheme molokai 
colorscheme flattened_dark 

" >>>>>>>>>>>>>>>>>Search
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic

" >>>>>>>>>>>>>>> 设置缩进
set autoindent
set smartindent
" 将制表符扩展为空格
set expandtab
set smarttab
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 设置编辑时制表符占用空格数
set tabstop=4

au FileType html,htmldjango setlocal sw=2 ts=2 

" >>>>>>>>>>>>>>> Fold
" 不自动回行
set nowrap
" 允许折叠代码
set foldenable
" 根据缩进对代码进行折叠
set foldmethod=indent
" 初始状态不折叠代码
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Key Mappings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
set backspace=eol,start,indent
noremap // :nohl<CR>                    " 取消高亮显示

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

vnoremap < <gv
vnoremap > >gv

" >>>>>>>>>>>>>>>>>>>>>>>>>>>> Forbid using arrow
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" >>>>>>>>>>>>>>>>>>>>>>>>>>> Window Navigation Mappings
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" >>>>>>>>>>>>>>>>>>>>>>>>>> QuickFix Navigation Mappings
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprev<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprev<CR>zz

nnoremap <leader>c :cclose<bar>lclose<cr>

" >>>>>>>>>>>>>>>>>>>>>>>>>> Buffers Navigation Mappings
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>

" >>>>>>>>>>>>>>>>>>>>>>>>>>>> Tab Navigation Mappings 
nnoremap ]t :tabnext<CR>
nnoremap [t :tabprevious<CR>
map tm :tabm
map tt :tabnew

" >>>>>>>>>>>>>>>>>>>>>>>>>>>> Enable folding with the space
nnoremap <space> za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Generals                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog='/home/jj/miniconda3/bin/python'
" let g:python3_host_prog='/usr/bin/python3'
let g:python_host_prog='/usr/bin/python'
set shell=/bin/bash

" >>>>>>>>>>>>>>>>>>>>>> Files, Backups and Undo
set noswapfile
set nobackup
set autowrite
set autoread
set undolevels=1000
set history=1000
set clipboard=unnamed,unnamedplus

" >>>>>>>>>>>>>>>>>>>>>> Set encodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

" in case you forgot to sudo
cnoremap w!! %!sudo tee % > /dev/null

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
              \exe "normal! g'\"" | endif
endif

" auto save
autocmd BufLeave,CursorHold,CursorHoldI,FocusLost * silent! wa

" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Plugs                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')


Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'mg979/vim-visual-multi'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'tmhedberg/SimpylFold'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 't9md/vim-choosewin'
Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'tweekmonster/django-plus.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'tpope/vim-surround'

Plug 'mattn/emmet-vim'


call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Win-Chooser                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              IndentLine                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  FZF                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               NerdCommenter                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims=1
let g:NERDAltDelims_python=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Airlines                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Coc Config                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 增强模式中的命令行自动完成操作
set wildmode=list:longest
set completeopt+=noinsert,menuone,noselect
set completeopt-=preview
set shortmess+=c


let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd FileType htmldjango let b:coc_pairs = [["% ", " %"]]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                      Simply Fold                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SimpylFold_docstring_preview=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                      Quick Run                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python3 %"
    endif
endfunction


