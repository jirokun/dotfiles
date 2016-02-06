" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on

set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
set list
""全角スペースをハイライト表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme	   * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

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
nnoremap <C-n> :lnext<CR>
nnoremap <C-p> :lprevious<CR>
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

" syntasticの設定
let g:syntastic_coffee_coffeelint_post_args = '-f /home/vagrant/s-code/coffee.json'
let g:syntastic_always_populate_loc_list=1

" popup menuの色を変更
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.erb set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.coffee set tabstop=2 shiftwidth=2 expandtab filetype=coffee
au BufNewFile,BufRead *.less set tabstop=2 shiftwidth=2 expandtab filetype=less
au BufNewFile,BufRead *.scss set tabstop=2 shiftwidth=2 expandtab filetype=sass
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 expandtab filetype=javascript
au BufNewFile,BufRead *.json set tabstop=2 shiftwidth=2 expandtab filetype=javascript
au BufNewFile,BufRead *.jsx set tabstop=2 shiftwidth=2 expandtab filetype=javascript
au BufNewFile,BufRead *.ts set tabstop=2 shiftwidth=2 expandtab filetype=typescript
au BufNewFile,BufRead *.sh set tabstop=2 shiftwidth=2 expandtab filetype=sh
au BufNewFile,BufRead *.jsp set tabstop=2 shiftwidth=2 expandtab filetype=html
