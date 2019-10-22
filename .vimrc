""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" fzf
" Use brew fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
" Ripgrep
" Use brew ripgrep
Plug 'jremmen/vim-ripgrep'

" Gitを便利に使う
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ruby / Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'slim-template/vim-slim'
" language pack
Plug 'sheerun/vim-polyglot'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'
" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" CSVをカラム単位に色分けする
Plug 'mechatroner/rainbow_csv'
" color scheme
Plug 'lifepillar/vim-solarized8'
" statusline
Plug 'itchyny/lightline.vim'
" Lint
Plug 'w0rp/ale'
" Helpers for UNIX
Plug 'tpope/vim-eunuch'

" ctrl+pで補完

call plug#end()

""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" undoファイルは作成しない
set noundofile
" コマンドラインに使われる画面上の行数
set cmdheight=1
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" 行を強調表示
set cursorline
" -- INSERT -- is unnecessary
set noshowmode
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
"set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme solarized8_flat
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" file indentation
" Ruby
"autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
"autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" fzf
nnoremap ; :Buffers<CR>
nnoremap t :Files<CR>
nnoremap r :Tags<CR>

" NERDTree
noremap - :NERDTreeToggle<CR>
" autocmd BufWinEnter * NERDTreeFind
noremap ] :NERDTreeFind<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" filetypeの自動検出
filetype on

