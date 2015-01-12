"General Configuration
set history=1000
filetype plugin on
filetype indent on

set autoread
set so=7
set wildmenu
set ruler
set cmdheight=2
set hid
set whichwrap+=<,>,h,l
set smartcase
set ignorecase
set hlsearch
set incsearch
set magic
set showmatch
set mat=3
set nu
"Colors and fonts
syntax enable
set encoding=utf8
set ffs=unix,dos,mac
set t_Co=256

"Files
set nobackup
set nowb
set noswapfile

"Text
set cursorline
set cursorcolumn
set expandtab
set tabstop=4
set shiftwidth=4

set smarttab

set lbr
set tw=500

set autoindent
set smartindent
set wrap

"Status Line
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"Plugins
call pathogen#infect()

"Taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let Tlist_Show_One_File = 0 
let Tlist_Exit_OnlyWindow = 1

"Java browser plugin
let JavaBrowser_Ctags_Cmd = '/usr/bin/ctags'
let JavaBrowser_Use_Highlight_Tag = 1


"Nerd Tree
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


"au FileType javascript call JavaScriptFold()


"Change the colors of javascript files

" syntax highlighting
 set background=dark     " you can use `dark` or `light` as your background
 syntax on
 colors mango

 "automatically close NerdTree when no buffer activated
 "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
 "autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") && (bufwinnr("__Tag_List__") != -1)) | q | endif
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if ((bufwinnr(t:NERDTreeBufName) != -1) || (bufwinnr("__Tag_List__") != -1 ))
            if winnr("$") == 1
                q
            elseif winnr("$") == 2
                if ((bufwinnr("__Tag_List__") != -1 ) && (bufwinnr(t:NERDTreeBufName) != -1))
                    qall
                endif
            endif
        endif
    endif
endfunction 
 map <F2> :NERDTreeToggle<CR>
 map <C-b> :bn<CR>
 map <C-S-b> :bp<CR>
 map <C-s> :w<CR>
 map <C-q> :q!<CR>
 map <C-e> :wq<CR>

 "window navigation
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l
