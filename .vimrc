""""""""""""""""""""""""""""""
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
" バックアップディレクトリの指定(でもバックアップは使ってない)

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
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
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
set t_Co=256
" 行番号の色
"highlight LineNr ctermfg=darkyellow
 set autoread

 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

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

"*****************************************************************************


" プラグインのセットアップ
"*****************************************************************************
"" NeoBundle core
"*****************************************************************************
if has('vim_starting')
  set nocompatible
   " Be iMproved
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
let solarized_vim=expand('~/.vim/colors/solarized.vim')

let g:vim_bootstrap_langs = "javascript,ruby,python,html,go"
let g:vim_bootstrap_editor = "vim"

" nvim or vim
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"

  " Run shell script if exist on custom select language
endif

if !filereadable(solarized_vim)
  echo "Installing Solarized Theme..."
  echo ""

  silent !mkdir -p ~/.vim/colors
  silent !mkdir -p ~/.vim/tmp
  silent !git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/tmp/solarized
  !mv ~/.vim/tmp/solarized/colors/solarized.vim ~/.vim/colors/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"*****************************************************************************
""" Functions
"*****************************************************************************
function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction


"*****************************************************************************
"" NeoBundle install packages
"*****************************************************************************
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdtree'


"" 補完
if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete'
    "" NeoBundle 'supermomonga/neocomplete-rsense.vim', {'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],}
else
    NeoBundle 'Shougo/neocomplcache'
    "" NeoBundle 'Shougo/neocomplcache-rsense.vim', {'depends': ['Shougo/neocomplcache.vim', 'marcus/rsense'],}
endif

" 自分用 snippet ファイルの場所
let s:my_snippet = '~/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet

NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>r

""proxy設定

if filereadable($HOME . '.vimrc.local')
    source $HOME/.vimrc.local
  endif

  NeoBundle 'Shougo/vimproc.git'

"" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'

"" ctags
NeoBundle 'majutsushi/tagbar'
NeoBundle 'szw/vim-tags'

NeoBundle 'tpope/vim-endwise'

"" 構文チェック
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'

"" markdownプレビュー
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

"" python構文・コーディング規約チェック
NeoBundle 'Flake8-vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'hynek/vim-python-pep8-indent'


NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'Shougo/vimfiler'

"" indent可視化
NeoBundle 'Yggdroot/indentLine'

""ejs
au BufNewFile,BufRead *.ejs set filetype=html


augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END


"" HTML/CSS/JavaScript
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'

""sass compile
NeoBundle 'AtsushiM/search-parent.vim'
NeoBundle 'AtsushiM/sass-compile.vim'

"# ~/.vimrc
"------------------------------------
" sass
"------------------------------------
""{{{
let g:sass_compile_auto = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file = ['scss', 'sass']
let g:sass_compile_beforecmd = ''
let g:sass_compile_aftercmd = ''
"}}}


NeoBundle 'mattn/emmet-vim'
let g:user_emmet_leader_key='<c-y>'


"NeoBundle 'othree/html5.vim'


"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'cakebaker/scss-syntax.vim'

NeoBundle 'soramugi/auto-ctags.vim'

"JavaScript構文チェック
NeoBundle 'othree/yajs.vim'
NeoBundle 'maxmellon/vim-jsx-pretty'



"typescript


" vim-jsx用の設定
let g:jsx_ext_required = 1        " ファイルタイプがjsxのとき読み込む．
let g:jsx_pragma_required = 0     " @から始まるプラグマでは読み込まない．

augroup Vimrc
    autocmd!
      autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" optional
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'mxw/vim-jsx'
" javascriptとJSXの2つのファイルタイプを指定する
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx
NeoBundle 'tpope/vim-surround'
NeoBundle 'othree/yajs.vim'

"ES6 syntax highlight
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}
autocmd BufRead,BufNewFile *.es6 setfiletype javascript



"" JSON syntax
NeoBundle 'elzr/vim-json'

NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'jason0x43/vim-js-indent'

"" mustache / handlebars
NeoBundle 'mustache/vim-mustache-handlebars'

"" nodejs補完
NeoBundle 'myhere/vim-nodejs-complete'

"" vim-airlineの設定
NeoBundle 'bling/vim-airline'


"" rails補完
NeoBundle 'tpope/vim-rails'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'



" コード補完
NeoBundle 'Shougo/neocomplete.vim'
" 静的解析
NeoBundle 'scrooloose/syntastic'
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'



"" 複数湖面とのON/OFF切り替え
NeoBundle 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
NeoBundle 'tpope/vim-surround'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {
  \   'commands' : ['EasyAlign'],
  \   'mappings' : ['<Plug>(EasyAlign)'],
  \ }}

" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}


"PHP//syntax
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1



" vim-php-cs-fixer {{{
NeoBundleLazy 'stephpy/vim-php-cs-fixer', {'functions': 'PhpCsFixerFixFile'}
nnoremap <Leader>php :<C-u>call<Space>PhpCsFixerFixFile()<CR>
let s:hooks = neobundle#get_hooks('vim-php-cs-fixer')
function! s:hooks.on_source(bundle) abort "{{{
  let g:php_cs_fixer_config                 = 'default'
  let g:php_cs_fixer_dry_run                = 0
  let g:php_cs_fixer_enable_default_mapping = 0
  let g:php_cs_fixer_fixers_list            = 'align_equals,align_double_arrow'
  let g:php_cs_fixer_level                  = 'symfony'
  let g:php_cs_fixer_php_path               = 'php'
  let g:php_cs_fixer_verbose                = 0
endfunction "}}}
"}}}

"----------------------------------------------------------
" インストール
"----------------------------------------------------------
if has('lua') " lua機能が有効になっている場合・・・・・・①
    " コードの自動補完
    NeoBundle 'Shougo/neocomplete.vim'
    " スニペットの補完機能
    NeoBundle "Shougo/neosnippet"
    " スニペット集
    NeoBundle 'Shougo/neosnippet-snippets'
endif













"syntaxチェック設定
" vimproc {{{
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak',},}
"}}}

" vim-qfstatusline {{{
function! MyStatuslineSyntax() abort "{{{
    return qfstatusline#Update()
endfunction "}}}

function! MyStatuslinePaste() abort "{{{
    if &paste is# 1
        return '(paste)'
    endif
    return ''
endfunction "}}}

NeoBundle 'KazuakiM/vim-qfstatusline'
let g:Qfstatusline#UpdateCmd = function('MyStatuslineSyntax')
set laststatus=2
set cmdheight=1
set statusline=\ %t\ %m\ %r\ %h\ %w\ %q\ %{MyStatuslineSyntax()}%=\ %{MyStatuslinePaste()}\ \|\ %Y\ \|\ %{&fileformat}\ \|\ %{&fileencoding}\
"}}}

" vim-quickrun {{{
NeoBundleLazy 'thinca/vim-quickrun', {'commands': 'QuickRun'}
nnoremap <Leader>run :<C-u>QuickRun<CR>
let g:quickrun_config = {
\    '_': {
\        'hook/close_buffer/enable_empty_data': 1,
\        'hook/close_buffer/enable_failure':    1,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':botright',
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           600},
\    'watchdogs_checker/_': {
\        'hook/close_quickfix/enable_exit':        1,
\        'hook/back_window/enable_exit':           0,
\        'hook/back_window/priority_exit':         1,
\        'hook/qfstatusline_update/enable_exit':   1,
\        'hook/qfstatusline_update/priority_exit': 2,
\        'outputter/quickfix/open_cmd':            ''},
\    'watchdogs_checker/php': {
\        'command': 'php',
\        'cmdopt':  '-l -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0',
\        'exec':    '%c %o %s:p',
\        'errorformat': '%m\ in\ %f\ on\ line\ %l'},}
"}}}

" vim-watchdogs {{{
NeoBundleLazy 'osyo-manga/vim-watchdogs', {'depends': 'osyo-manga/shabadou.vim', 'insert': 1}
let s:hooks = neobundle#get_hooks('vim-watchdogs')
function! s:hooks.on_source(bundle) abort "{{{
    "vim-watchdogs
    let g:watchdogs_check_BufWritePost_enable  = 1
    let g:watchdogs_check_CursorHold_enable    = 1
endfunction "}}}

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
let mapleader="\<Space>"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Searching
set ignorecase


"" Encoding
set bomb
set binary
set ttyfast

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

set whichwrap=h,l,b,s,<,>,[,]

"" JSONのダブルクォーテーションを表示する
let g:vim_json_syntax_conceal = 0

"" 改行時に自動でコメントを挿入するのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

let g:vim_json_syntax_conceal=0

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set background=dark

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', 'bower_components']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
noremap <leader>n :NERDTreeToggle<CR>

"*****************************************************************************
""" Mappings
"*****************************************************************************
"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"******************
"" neosnippet
imap <c-k>     <Plug>(neosnippet_expand_or_jump)
smap <c-k>     <Plug>(neosnippet_expand_or_jump)
xmap <c-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
"******************

"******************
if s:meet_neocomplete_requirements()
  "" neocomplete
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
else
  "" neocomplcache
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
"******************

"******************
" tagbar
if ! empty(neobundle#get("tagbar"))
  let g:tagbar_width = 20
  nn <silent> <leader>t :TagbarToggle<CR>
endif
"******************

"******************
" ctags
let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8_1/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
let g:vim_tags_auto_generate = 1
set tags+=.tags
set tags+=.Gemfile.lock.tags

if has("path_extra")
  set tags+=tags;
endif

nnoremap <C-]> g<C-]>
"******************

"******************
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']




let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_scss_checkers = ['scss_lint']

let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"******************

"******************
" typescript
au BufRead,BufNewFile,BufReadPre *.ts set filetype=typescript
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et

"ECMAScript対策
let g:syntastic_typescript_tsc_args = "--experimentalDecorators --target ES5"

"******************

"******************
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
            \    'variables': {
            \      'lang': "ja"
            \    },
            \   'indentation': '  '
            \ }
"******************

"******************
" rsense
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
"******************

"******************
" PyFlake
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
"******************

"******************
" jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"******************

"******************
" typescript
autocmd BufRead,BufNewFile *.ts set filetype=typescript
let g:typescript_indent_disable = 1
"******************

"******************
" indentLine
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'calendar', 'thumbnail']
"******************

"******************
" mustache / handlebars
let g:mustache_abbreviations = 1
"******************

"******************
" vim-nodejs-complete
:setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
"******************

"*****************************************************************************
" Indent Width
"*****************************************************************************"
set shiftwidth=2
set tabstop=2

augroup indent
  autocmd! FileType python setlocal shiftwidth=4 tabstop=4
augroup END

set expandtab

"*****************************************************************************
" Large File
"*****************************************************************************"
set synmaxcol=256
set nowrap

" file is large from 10mb
let g:LargeFile = 1024 * 100
augroup LargeFile
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction


  let g:airline_enable_branch = 0
  let g:airline_section_b = "%t %M"
  let g:airline_section_c = ''
  let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
  let g:airline_section_x =
        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
        \ "%{strlen(&filetype)?&filetype:'no ft'}"
  let g:airline_section_y = '%3p%%'
  let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
  let g:airline#extensions#whitespace#enabled = 0


  inoremap ( ()<ESC>i
  inoremap <expr> ) ClosePair(')')
  inoremap { {}<ESC>i
  inoremap <expr> } ClosePair('}')
  inoremap [ []<ESC>i
  inoremap <expr> ] ClosePair(']')
  " pair close checker.
  " from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
  function ClosePair(char)
      if getline('.')[col('.') - 1] == a:char
          return "\<Right>"
      else
          return a:char
      endif
  endf

NeoBundleCheck

setlocal omnifunc=syntaxcomplete#Complete
