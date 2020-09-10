""" .vimrc
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'mattn/emmet-vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'
call plug#end()

""" basic
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

""""""""""""""""""""""""""""""""""""""""""""" map 
let mapleader = ','
map <leader>e :vsplit ~/.vimrc<cr>
map <leader>R :source ~/.vimrc<cr>
map <leader>q :nohl<cr>
map <leader>I :set invnumber <bar> set invrelativenumber<cr>
xnoremap < <gv
xnoremap > >gv
nmap j gj
nmap k gk

"""""""""""""""""""""""""""""""" quickfix
map <c-j> :cnext<cr>
map <c-k> :cprevious<cr>
noremap <leader>c :cclose<cr>
nnoremap <leader>o :copen<cr>

"""""""""""""""""""""""""" localtionlist
map <c-n> :lnext<cr>
map <c-p> :lprevious<cr>
nnoremap <leader>C :lclose<cr>
nnoremap <leader>O :lopen<cr>

"""""""""""""""""""""""""""" buffers
nnoremap <leader>d :bd<cr>

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

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unicode_symbols = 1

nmap <space>1 <Plug>lightline#bufferline#go(1)
nmap <space>2 <Plug>lightline#bufferline#go(2)
nmap <space>3 <Plug>lightline#bufferline#go(3)
nmap <space>4 <Plug>lightline#bufferline#go(4)
nmap <space>5 <Plug>lightline#bufferline#go(5)
nmap <space>6 <Plug>lightline#bufferline#go(6)
nmap <space>7 <Plug>lightline#bufferline#go(7)
nmap <space>8 <Plug>lightline#bufferline#go(8)
nmap <space>9 <Plug>lightline#bufferline#go(9)
nmap <space>0 <Plug>lightline#bufferline#go(10)

function! LightlineModified()
return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
return &ft !~? 'help' && &readonly ? "r" : ''
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
        let mark = ""  " edit here for cool mark
        let branch = fugitive#head()
        return branch !=# '' ? mark.branch : ''
    endif
catch
endtry
return ''
endfunction

function! LightlineFileformat()
return winwidth(0) > 70 ? (&fileformat) : ''
endfunction

function! LightlineFiletype()
return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
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

nmap <space>f :Files<cr>
nmap <space>b :Buffers<cr>
nmap <space>w :Windows<cr>

"""""""""""""""""""""""""""""""""""" vim-gitgutter
nmap <space>j <Plug>(GitGutterNextHunk)
nmap <space>k <Plug>(GitGutterPrevHunk)
nmap <space>v <Plug>(GitGutterPreviewHunk)
nmap <space>u <Plug>(GitGutterUndoHunkh)

"""""""""""""""""""""""""""""""""""""""" vim-easymotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)


"""""""""""""""""""""""""" ultisnips
let g:UltiSnipsExpandTrigger = '<c-f>'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'

"""""""""""""""""""""""""""""""" markdown-preview.nvim
let g:mkdp_echo_preview_url = 1
let g:mkdp_open_to_the_world = 1

nmap <leader>p <Plug>MarkdownPreviewToggle

"""""""""""""""""""""""""""" nerttree
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 3
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 41

map <leader>n :NERDTreeFocus<cr>
map <leader>s :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""" tagbar
let g:tagbar_width = 41

map <leader>t :TagbarOpenAutoClose<cr>

"""""""""""""""""""""""""" ack.vim
let g:ackprg = 'ag --vimgrep'

"""""""""""""""""""""""""""" ale
let g:ale_echo_msg_format='[%linter%][%severity%]%code: %%s '
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linter_aliases = {
\   'vue': ['vue', 'javascript'],
\}

let g:ale_linters = {
\   'go': ['golint', 'gopls', 'golangci-lint'],
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'html': ['alex'],
\   'json': ['jsonlint'],
\   'yaml': ['yamllint'],
\   'vim': ['vint'],
\   'ansible': ['ansible-lint'],
\   'vue': ['eslint', 'vls'],
\}

let g:ale_fixers = {
\   'python': ['autopep8', 'reorder-python-imports'],
\   'javascript': ['eslint'],
\   'html': ['prettier'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'css': ['prettier'],
\   'markdown': ['prettier'],
\   'vue': ['eslint'],
\}

""""""""""""""""""""""" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_use_clangd = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_key_list_stop_completion = ['<c-y>', '<Enter>']
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_server_python_interpreter='python3'
let g:ycm_extra_conf_vim_data = [ 
\   'g:ycm_python_interpreter_path',
\   'g:ycm_python_sys_path',
\]
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

nnoremap gj :YcmCompleter GoTo<cr>
nnoremap gt :YcmCompleter GoToType<cr>
nnoremap gi :YcmCompleter GetType<cr>
nnoremap gk :YcmCompleter GetDoc<cr>

"""""""""""""""""""""""""""""""" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_fmt_command = 'goimports'
let g:go_implements_mode = 'gopls'
let g:go_snippet_engine = 'ultisnips'
let g:go_metalinter_deadline = '5s'
let g:go_decls_mode = 'fzf'
let g:go_debug_windows = {
\   'out': 'bo 10new',
\   'vars': 'lefta 30vnew',
\   'stack': 'rightb 21new',
\}

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"""""""""""""""""""""""" emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<c-e>'
autocmd FileType html,css,vue,js,ts EmmetInstall

"""""""""""""""""""""""""""""""" .vimrc ends
