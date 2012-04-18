filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'kchmck/vim-coffee-script'

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
" nmap gb :ls<CR>:buf 

" sort css property (id:secondlife)
nmap gso vi{:!sortcss<CR>
vmap gso i{:!sortcss<CR>

" indent whole buffer
noremap <F8> gg=G``

" xml close tag comp
" autocmd FileType html,xhtml,xml :inoremap </ </<C-X><C-O>

" insert timestamp
"nmap tw :exe "normal! i" . strftime("%Y-%m-%d\T%H:%M:%S+09:00")<CR>

"nmap bg :BufferExplorer<CR>
"nmap bG :FilesystemExplorerFromHere<CR>
"nmap gb :FilesystemExplorer<CR>
"nmap br :FuzzyFinderMru<CR>

" {{{ Autocompletion using the TAB key

" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<TAB>"
	else
		if pumvisible()
			return "\<C-N>"
		else
			return "\<C-N>\<C-P>"
		end
	endif
endfunction
" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" }}} Autocompletion using the TAB key

set iminsert=0 imsearch=0

set lazyredraw
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"

let g:AutoComplPop_CompleteOption = '.,w,b,k'

au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.coffee set tabstop=2 shiftwidth=2 expandtab filetype=coffee
