"""""""""""""""""""""""" .vimrc
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --go-completer --ts-completer --clang-completer' }
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mtth/scratch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"""""""""""""""""""""""""""""""" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
"""""""""""""""""""""""""""""""""" web
Plug 'mattn/emmet-vim'
Plug 'heavenshell/vim-jsdoc'
"""""""""""""""""""""""""""""" go
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""" basic
set nocompatible
set history=500
set cmdheight=1
set ruler
set backspace=indent,eol,start
set magic
set encoding=utf-8
set fileformats=unix,mac,dos
set hidden
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set matchtime=2
set noerrorbells
set novisualbell
set noswapfile
set nobackup
set number relativenumber numberwidth=4
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline
set laststatus=2
set showtabline=2
set noshowmode
set background=dark
set autowrite
set autoread
set updatetime=100
set completeopt-=preview
set showcmd
set scrolljump=5
set scrolloff=3
set nojoinspaces
set splitbelow
set grepprg=ag\ --nogroup\ --nocolor
set wrap
set linebreak
set wrapmargin=2
set scl=yes 

autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)\c')

""""""""""""""""""""""""""""""""""""""""""""" map 
let mapleader = ","
map <Leader>e :vsplit ~/.vimrc<CR>
map <Leader>r :source ~/.vimrc<CR>
" Find merge conflict markers
map <Leader>fc /\v^[<\|=>]{7}( .*\|$)<CR> 
map <Leader>nl :nohl<CR>
map <Leader>nn :set invnumber <BAR> set invrelativenumber<CR>
xnoremap < <gv
xnoremap > >gv
nmap j gj
nmap k gk

"""""""""""""""""""""""""""""""" quickfix
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <Leader>c :cclose<CR>
nnoremap <Leader>o :copen<CR>

"""""""""""""""""""""""""" localtionlist
map <C-n> :lnext<CR>
map <C-p> :lprevious<CR>
nnoremap <Leader>C :lclose<CR>
nnoremap <Leader>O :lopen<CR>

"""""""""""""""""""""""""""" buffers
nnoremap <Leader>d :bd<CR>

"""""""""""""""""""""""""""""""""""""""" gruvbox
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""" lightline.vim
let g:lightline = {
\   'colorscheme': 'gruvbox',
\   'active': {
\       'left': [['mode', 'paste'], ['fugitive', 'filename']],
\       'right': [ 
\           ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
\           ['lineinfo', 'percent'], 
\           ['fileformat', 'fileencoding', 'filetype'],
\       ],
\   },
\   'component_function': {
\       'fugitive': 'LightlineFugitive',
\       'filename': 'LightlineFilename',
\       'fileformat': 'LightlineFileformat',
\       'filetype': 'LightlineFiletype',
\       'fileencoding': 'LightlineFileencoding',
\       'mode': 'LightlineMode',
\   },
\   'subseparator': {'left': '|', 'right': '|'},
\}

let g:lightline.tabline = {'left': [['buffers']], 'right': [['']]}
let g:lightline.component_type = {
\   'buffers': 'tabsel',
\   'linter_checking': 'left',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'left',
\}

let g:lightline.component_expand = {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\   'buffers': 'lightline#bufferline#buffers',
\}

let g:lightline#ale#indicator_checking = "\uf110 "
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c "

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unicode_symbols = 1

nmap <Space>1 <Plug>lightline#bufferline#go(1)
nmap <Space>2 <Plug>lightline#bufferline#go(2)
nmap <Space>3 <Plug>lightline#bufferline#go(3)
nmap <Space>4 <Plug>lightline#bufferline#go(4)
nmap <Space>5 <Plug>lightline#bufferline#go(5)
nmap <Space>6 <Plug>lightline#bufferline#go(6)
nmap <Space>7 <Plug>lightline#bufferline#go(7)
nmap <Space>8 <Plug>lightline#bufferline#go(8)
nmap <Space>9 <Plug>lightline#bufferline#go(9)
nmap <Space>0 <Plug>lightline#bufferline#go(10)

function! LightlineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? "\uf023" : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
              \ fname == '__Tagbar__' ? g:lightline.fname :
              \ fname =~ '__Gundo\|NERD_tree' ? '' :
              \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
              \ &ft == 'unite' ? unite#get_status_string() :
              \ &ft == 'vimshell' ? vimshell#get_status_string() :
              \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
              \ ('' != fname ? fname : '[No Name]') .
              \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = "\uf126 "  " edit here for cool mark
            let branch = fugitive#head()
            return branch !=# '' ? mark.branch : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""" fzf.vim
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1

nmap <Space>ff :Files<CR>
nmap <Space>fb :Buffers<CR>
nmap <Space>fw :Windows<CR>
nmap <Space>fH :History<CR>
nmap <Space>fh :History:<CR>
nmap <Space>fs :History/<CR>
nmap <Space>fa :Ag<CR>
nmap <Space>fM :Maps<CR>
nmap <Space>fm :Marks<CR>
nmap <Space>fc :Commands<CR>
nmap <Space>ft :BTags<CR>
nmap <Space>fT :Tags<CR>

"""""""""""""""""""""""""""""""""""" vim-gitgutter
nmap <Space>gj <Plug>(GitGutterNextHunk)
nmap <Space>gk <Plug>(GitGutterPrevHunk)
nmap <Space>gh <Plug>(GitGutterPreviewHunk)
nmap <Space>gs <Plug>(GitGutterStageHunk)
nmap <Space>gu <Plug>(GitGutterUndoHunk)

"""""""""""""""""""""""""""""""""""""""" vim-easymotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

"""""""""""""""""""""""""" ultisnips
let g:UltiSnipsExpandTrigger="<C-f>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

"""""""""""""""""""""""""""""""" markdown-preview.nvim
let g:mkdp_open_ip = '192.168.56.77'
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_to_the_world = 1

nmap <Leader>mp <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""" nerttree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 3
let NERDTreeAutoDeleteBuffer = 1

map <Leader>nt :NERDTreeFocus<CR>
map <Leader>j :NERDTreeFind<CR>

"""""""""""""""""""""""""" ack.vim
let g:ackprg = 'ag --vimgrep'

nnoremap <Leader>s :Ack!<Space>
nnoremap <Space>w :Ack! "\b<C-r><C-w>\b"<CR>

"""""""""""""""""""""""""" vim-easy-align
nmap <Leader>a <Plug>(EasyAlign)
xmap <Leader>a <Plug>(EasyAlign)

"""""""""""""""""""""""""""" scratch.vim
let g:scratch_no_mappings = 1
let g:scratch_persistence_file = '~/.cache/vim/scratch.vim'

nmap <Leader>gs <plug>(scratch-insert-reuse)
nmap <Leader>gS <plug>(scratch-insert-clear)
xmap <Leader>gs <plug>(scratch-selection-reuse)
xmap <Leader>gS <plug>(scratch-selection-clear)

"""""""""""""""""""""""""""" ale
let g:ale_sign_warning = "\uf071"
let g:ale_sign_error = "\uf05e"
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'go': ['golint', 'gopls'],
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'css': ['prettier'],
\   'python': ['autopep8'],
\}

""""""""""""""""""""""" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_use_clangd = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_key_list_stop_completion = ['<C-y>', '<Enter>']
"""""""""""""""""""""" python
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [ 
\   'g:ycm_python_interpreter_path',
\   'g:ycm_python_sys_path',
\]
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

nnoremap <Space>jd :YcmCompleter GoTo<CR>
nnoremap <Space>jt :YcmCompleter GoToType<CR>
nnoremap <Space>ji :YcmCompleter GetType<CR>
nnoremap <Space>jk :YcmCompleter GetDoc<CR>

"""""""""""""""""""""""""""""""" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_test_timeout = "10s"
let g:go_info_mode = 'gopls'
let g:go_auto_sameids = 1
let g:go_updatetime = 100
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_def_mode = 'gopls'
let g:go_snippet_engine = "ultisnips"
let g:go_metalinter_deadline = "5s"
let g:go_decls_mode = 'fzf'
" let g:go_debug = ['shell-commands']
let g:go_debug_windows = {
\   'out': 'bo 10new',
\   'vars': 'lefta 30vnew',
\   'stack': 'rightb 21new',
\}

function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <Space>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Space>I <Plug>(go-implements)
autocmd FileType go nmap <Space>r  <Plug>(go-run)
autocmd FileType go nmap <Space>t  <Plug>(go-test)
autocmd FileType go nmap <Space>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Space>i <Plug>(go-info)
autocmd FileType go nmap <Space>T :GoDefType<CR>
autocmd FileType go nmap <Space>e :GoIfErr<CR>
autocmd FileType go nmap <Space>s :GoFillStruct<CR>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"""""""""""""""""""""""" emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-e>'
autocmd FileType html,css,vue,js,ts EmmetInstall

"""""""""""""""""""""""""""""""" .vimrc ends
