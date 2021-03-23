set nocompatible              " be iMproved, required
filetype off                  " required

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Common
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
"######## airline font solove method################################
"the font problem, see myself write below, there are solve method!!!!!
"########################################
Plugin 'majutsushi/tagbar'
Plugin 'powerline/fonts'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
"Plugin 'godlygeek/tabular'

"Plugin 'rdnetto/YCM-Generator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'vim-syntastic/syntastic'
"python
Plugin 'mindriot101/vim-yapf'



" nginx
"Plugin 'nginx.vim'

" markdown
"Plugin 'plasticboy/vim-markdown'

" cpp
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'DoxygenToolkit.vim'

" google style
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" ros
Plugin 'taketwo/vim-ros'
"Plugin 'ompugao/ros.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" themes
Plugin 'altercation/vim-colors-solarized'

"switch within .cpp/.h
Plugin 'ImAaronChou/vim-fswitch'
Plugin 'ImAaronChou/BufferControl'


" All of your Plugins must be added before the following line
call vundle#end()            " required

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
Glaive codefmt plugin[mappings]
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" tab navigation like firefox "

" syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set laststatus=2

" python {
"function! GetPythonExec()
    "let python_exec = system("which python")
    "return python_exec
"endfunction
"let g:ycm_python_binary_path = 'python'
"function! GetPythonVersion()
    "let python_version = system("python -c 'import sys; print(sys.version_info[0])'")[0]
    "return python_version
"endfunction
"let python_version = GetPythonVersion()
"let flake8_exec = '/usr/local/bin/flake8-python' . python_version
" }

" ycm
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_server_python_interpreter = '/usr/bin/python'

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 5

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 3
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 5
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_exec = flake8_exec
" let g:syntastic_python_flake8_exe = 'python3 -m flake8'
" }

" airline {
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = 'badwolf'
"let g:airline_section_z = ''

let g:airline#extensions#default#layout = [
            \ [ 'a', 'b', 'x'],
            \ [ 'c','z', 'error', 'warning' ]
            \ ]

"\ [ 'c', 'y', 'z', 'error', 'warning' ]
function! AirlineInit()
    let g:airline_section_c = airline#section#create(['readonly'])
    let g:airline_section_x = airline#section#create(['tagbar'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"######## airline font solove method################################
" air-line
" powerline/font's install.sh can not install font success
" see this url for install
"https://powerline.readthedocs.io/en/latest/installation/linux.html#patched-font-installation
"or you can copy all *.otf in ~/.vim/bundle/font/* to ~/.local/share/fonts/
"and run cmd "fc-cache -vf ~/.local/share/fonts/"
"
"the cmd is :
"cp ~/.vim/bundle/font/*/*.otf ~/.local/share/fonts/
"fc-cache -vf ~/.local/share/fonts/
"######## airline font solove method################################
" }


"auto format
function! Formatonsave()
      :FormatCode
  endfunction
  autocmd BufWritePre *.hpp,*.h,*.cc,*.cpp,*proto call Formatonsave()
""

" flake8 {
"let g:flake8_ignore = "E402"
" }

" google style

set t_Co=256
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

set encoding=utf-8
set fileencodings=utf-8,gbk
set fencs=utf-8,gbk
set langmenu=zh_CN.UTF-8
set helplang=cn

set nu!
set ts=4
set sw=4
set expandtab
set autoindent
set hlsearch
set history=1000

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo_dir")
    call mkdir($HOME."/.vim/undo_dir", "", 0700)
endif
set undodir=~/.vim/undo_dir
set undofile

set mouse-=a
set splitbelow
set splitright

set pastetoggle=<C-\\>

set shiftwidth=4

set backspace=indent,start

set hidden

" shortcuts
" tab
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>

"Buffer Controller
nnoremap <S-H>     :BPrev<CR>
nnoremap <S-L>     :BNext<CR>
nnoremap <S-Q>     :Bclose<CR>

" Window Switch 
nnoremap <C-h>     <C-W>h<C-W><ESC>
nnoremap <C-l>     <C-W>l<C-W><ESC>
nnoremap <C-j>     <C-W>j<C-W><ESC>
nnoremap <C-k>     <C-W>k<C-W><ESC>

" ycm
nnoremap <S-F>     :YcmCompleter FixIt<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"vim-fswitch
nmap <silent> <Leader>sw :FSHere<cr>
let g:fsnonewfiles='true' 

noremap j gj
noremap k gk

" multiple cursor
let g:multi_cursor_next_key='<S-N>'
let g:multi_cursor_prev_key='<S-P>'
let g:multi_cursor_skip_key='<S-X>'

" taglist
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 26

" NERD TREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1

" auto strip whitespace
map <C-s> 	:StripWhitespace<CR>

" markdown
let g:vim_markdown_folding_disabled = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
" format state mechine
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

augroup bufferignore
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

au BufNewFile,BufRead *.j2 set ft=jinja

autocmd VimEnter * NERDTree

set pastetoggle=<F2>

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

set ignorecase   "设置默认进行大小写不敏感查找
set smartcase  " 如果有一个大写字母，则切换到大小写敏感查找
set incsearch   "即时搜索

"set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"                            " 用空格键来开关折叠
let g:syntastic_python_python_exec = '/usr/bin/python' 

"proto syntax
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
