"""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""

" 保存時の文字コード
set fileencoding=utf-8

 " 読み込み時の文字コードの自動判別. 左側が優先される
 set fileencodings=ucs-boms,utf-8,euc-jp,cp932

 " 改行コードの自動判別. 左側が優先される
 set fileformats=unix,dos,mac

 " □や○文字が崩れる問題を解決
 set ambiwidth=double
" インクリメンタルサーチを行う
set incsearch

nnoremap :tree :NERDTreeToggle
  "構文ハイライト
syntax on
"タイトルの表示
set title
 ""アンダーライン設定
 set cursorline
"マウス操作有効
set mouse=a

syntax enable

set tabstop=4

set wrapscan

" コマンドを画面最下部に表示する
set showcmd

autocmd ColorScheme * highlight LineNr ctermfg=239
colorscheme molokai

" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" スクロールする時に下が見えるようにする
set scrolloff=5

" バックアップをしない
set nobackup
" ビープ音を消す
set belloff=all
" OSのクリップボードを使う
set clipboard=unnamed

set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

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

" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 画面上でタブ文字が占める幅の指定
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme molokai
" 256色対応
set t_Co=256
" 行番号の色
"highlight LineNr ctermfg=darkyellow
 set autoread

 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~

" カーソルラインをハイライト"
set cursorline

" インサートモードでbackspaceを有効に
set backspace=indent,eol,start
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" ビジュアルモードの選択範囲を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" vを二回で行末まで選択
vnoremap v $h
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" /{pattern}の入力中は「/」をタイプすると自動で「\/」が、
" ?{pattern}の入力中は「?」をタイプすると自動で「\?」が 入力されるようになる
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"ペースト設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" ステータスラインの表示内容強化

set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" tagsジャンプの時に複数ある時は一覧表示
"nnoremap <C-]> g<C-]>
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" 括弧の対応関係を一瞬表示する
set showmatch
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する "

" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数  "
set history=5000






"=================dein================
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" ここからインストールするプラグイン
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplcache-rsense.vim')

call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete.vim')

" ファイルツリー
call dein#add('scrooloose/nerdtree')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('thinca/vim-quickrun')
    call dein#add('thinca/vim-ref')
    call dein#add('vim-scripts/taglist.vim')

let g:vimfiler_as_default_explorer = 1
let g:indentLine_char = '¦'

    " JavaScript補完
      call dein#add('KazuakiM/neosnippet-snippets')
    call dein#add('KazuakiM/vim-qfstatusline')
    call dein#add('mojako/ref-sources.vim')
    call dein#add('pangloss/vim-javascript')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/neoinclude.vim')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('thinca/vim-quickrun')

    call dein#add('osyo-manga/shabadou.vim')
    call dein#add('osyo-manga/vim-watchdogs')
    call dein#add('mustardamus/jqapi', {'lazy':1})
    call dein#add('tokuhirom/jsref',   {'lazy':1})

    " Vue.js補完
  call dein#add('posva/vim-vue')
  call dein#add('Shougo/context_filetype.vim')
  "call dein#add('osyo-manga/vim-precious')

  call dein#add('mhartington/nvim-typescript', {
  \ 'hook_add': 'let g:nvim_typescript#vue_support = 1'
  \ })


" neocomplcacheの設定
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1


" Rsense用の設定
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"rsenseのインストールフォルダがデフォルトと異なるので設定
let g:rsenseHome = expand("/Users/kenta/.rbenv/shims/rsense")
let g:rsenseUseOmniFunc = 1


"色を付ける
syntax on
colorscheme molokai



"==============プラグイン関係の設定==============


let g:airline_theme = 'molokai'
"====================gitgutter====================
"変更箇所のハイライト
let g:gitgutter_highlight_lines = 0

"====================junegunn/vim-easy-align====================
"enterで整形設定に行くようにする
vmap <Enter> <Plug>(EasyAlign)

"====================neocomplcache====================
" ~Disable AutoComplPop. neocomplcashe~
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"~neocomplecas~


"====================neosnippet====================
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" ~ファイルタイプ毎 & gitリポジトリ毎にtagsの読み込みpathを変える~
"function! ReadTags(type)
"    try
  "      execute "set tags=".$HOME."/dotfiles/tags_files/".
  "            \ system("cd " . expand('%:p:h') . "; basename `git rev-parse --show-toplevel` | tr -d '\n'").
  "            \ "/" . a:type . "_tags"
  "  catch
  "      execute "set tags=./tags/" . a:type . "_tags;"
  "  endtry
"endfunction

"augroup TagsAutoCmd
"    autocmd!
 "   autocmd BufEnter * :call ReadTags(&filetype)
"augroup END


"====================osyo-manga/vim-anzu====================
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
" statusline
set statusline=%{anzu#search_status()}




" ====================indentLine====================
let g:indentLine_char = '¦' "use ¦, ┆ or │
"====================haya14busa/vim-operator-flashy====================
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$


"====================EmmetHmtl"====================
let g:user_emmet_leader_key='<C-t>'


"====================PHP"====================
" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
" $VIMRUNTIME/syntax/sql.vim
let g:sql_type_default = 'mysql' " MySQLの場合

"====================JavaScript"====================
" vim-ref {{{
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nmap <silent>K <Plug>(ref-keyword)
let g:ref_no_default_key_mappings = 1
let g:ref_cache_dir               = $HOME . '/.vim/vim-ref/cache'
let g:ref_detect_filetype         = {
\    'css':        'phpmanual',
\    'html':       ['phpmanual',  'javascript', 'jquery'],
\    'javascript': ['javascript', 'jquery'],
\    'php':        ['phpmanual',  'javascript', 'jquery']
\}
let g:ref_javascript_doc_path = $HOME . '/.vim/dein.vim/repos/github.com/tokuhirom/jsref/htdocs'
let g:ref_jquery_doc_path     = $HOME . '/.vim/dein.vim/repos/github.com/mustardamus/jqapi'
let g:ref_phpmanual_path      = $HOME . '/.vim/vim-ref/php-chunked-xhtml'
let g:ref_use_cache           = 1
let g:ref_use_vimproc         = 1
"}}}


"====================Ruby"====================
call dein#add('terryma/vim-multiple-cursors') "複数カーソル検索
nnoremap :mmm :MultipleCursorsFind
vnoremap :mmm :MultipleCursorsFind

call dein#add('tpope/vim-fugitive') "コマンドでgit add,commit,push
let g:airline#extensions#branch#enabled = 1

call dein#add('airblade/vim-gitgutter') "gitの編集状態をgutterに表示

"neocomplcache
call dein#add('Shougo/neocomplcache') "vimスクリプト補完
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
let g:loaded_matchparen = 1

call dein#add('itchyny/vim-parenmatch') "閉じ括弧に下線
" call dein#add('itchyny/vim-cursorword') "同じ単語に下線

call dein#add('othree/html5.vim') "シンタックスハイライトをHTML5に対応
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1

call dein#add('tomtom/tcomment_vim') "コメントアウトショートカット
nmap ww gcc
vmap ww gcc
if !exists('g:tcomment_types')
    let g:tcomment_types = {}
endif
let g:tcomment_types['eruby'] = '<%# %s %>'
let g:tcomment_types['erb'] = '<%# %s %>'
let g:tcomment_types['scss'] = '/* %s */'

call dein#add('alvan/vim-closetag', {'lazy':0, 'on_ft': ['html','xhtml']}) "閉じタグ自動補完

call dein#add('vim-ruby/vim-ruby') "rubyのシンタックスや補完

call dein#add('tpope/vim-rails') "railsの補完やシンタックスハイライト
autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip

call dein#add('alpaca-tc/vim-endwise.git') "railsのdef...endを補完
let g:endwise_no_mappings=1

call dein#add('mikoto2000/buffer_selector.vim') "バッファリストを表示
noremap <Space><Space> <Esc>:call buffer_selector#OpenBufferSelector()<Enter>

call dein#add('jelera/vim-javascript-syntax') "javascriptシンタックス

call dein#add('hail2u/vim-css3-syntax') "css3シンタックス

call dein#add('lilydjwg/colorizer') "色表示

call dein#add('cakebaker/scss-syntax.vim') "scssシンタックス

call dein#add('slim-template/vim-slim') "slimシンタックス

call dein#add('Shougo/context_filetype.vim') "ファイルタイプ判定
call dein#add('osyo-manga/vim-precious')
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

call dein#add('nathanaelkane/vim-indent-guides') "インデントの可視化
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333333 ctermbg=235
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2c2c2c ctermbg=240
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']


"閉じ自動保管
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap { {}<LEFT>

highlight Comment ctermfg=239
highlight Number ctermfg=09
highlight LineNr ctermfg=07
highlight Directory ctermfg=118
highlight RubyInstanceVariable ctermfg=208
highlight htmlTag ctermfg=15
highlight htmlEndTag ctermfg=15

autocmd BufRead,BufNewFile *.rb set filetype=ruby
autocmd BufRead,BufNewFile *.slim setfiletype slim
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""



" for lightline.vim
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['readonly', 'filename', 'modified', 'anzu']
  \   ]
  \ },
  \ 'component_function': {
  \   'anzu': 'anzu#search_status'
  \ }
  \ }

" シンタックスハイライトの最大行数
set synmaxcol=200
" シンタックスハイライト
syntax on
" .vueシンタックスハイライト
autocmd BufNewFile,BufRead *.vue set filetype=html


" for accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)





