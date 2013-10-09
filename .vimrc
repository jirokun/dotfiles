filetype off

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'

filetype plugin indent on

syntax on

set listchars=tab:>.
set list

" ちゃんと文字書いて○とか
set ambiwidth=double

" ポップアップメニューをよしなに
set completeopt=menu,preview,longest,menuone

" 補完候補の設定
set complete=.,w,b,u,k

" バックアップとか自分でしろ
set nobackup

" 検索は大文字小文字を分ける
set ignorecase

" 検索でハイライトする
set hlsearch

" 誰かが編集したら読み直して
set autoread

" 行番号の表示
set number
" デフォルトインデント設定
set autoindent smartindent
" よさげなタブ
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4
" BS の挙動
set backspace=indent,eol,start

" よしなにしてくれ
set ignorecase smartcase
" インクメンタル
set incsearch
" 最初にもどれ
set wrapscan

" 対応する括弧の表示
set showmatch
" 入力中のコマンドを表示
set showcmd

" 行頭・行末間移動を可能に
set whichwrap=b,s,h,l,<,>,[,]

" 補完候補を表示する
set wildmenu

" ステータス表示用変数
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}%=%l,%c%V%8P

"set termencoding=utf-8
"set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp

set hidden

filetype plugin on
filetype indent on

" mapping

nnoremap j gj
nnoremap k gk
nnoremap <C-j> :bp<CR>
" quickfix moving
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
" Unite buffer
nnoremap <C-e> :Unite buffer<CR>
" vimgrepした後はQuickFixウィンドウを開く
au QuickfixCmdPost grep,vimgrep copen

" nmap gb :ls<CR>:buf 

" sort css property (id:secondlife)
nmap gso vi{:!sortcss<CR>
vmap gso i{:!sortcss<CR>

" indent whole buffer
noremap <F8> gg=G``

set iminsert=0 imsearch=0

set lazyredraw
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"

let g:AutoComplPop_CompleteOption = '.,w,b,k'

au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.coffee set tabstop=2 shiftwidth=2 expandtab filetype=coffee
au BufNewFile,BufRead *.less set tabstop=2 shiftwidth=2 expandtab filetype=less
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 expandtab filetype=javascript
