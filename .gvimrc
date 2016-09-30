
" #### Vundle ####

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                   " required
Plugin 'scrooloose/nerdtree'                    " Directory Side Bar
Plugin 'altercation/vim-colors-solarized'       " Solarized Theme
Plugin 'fatih/vim-go'                           " Go Support For Vim
Plugin 'scrooloose/syntastic'                   " Syntax Checker
Plugin 'mxw/vim-jsx'                            " JSX hightlighting
Plugin 'othree/yajs.vim'                        " Yet Another JavaScript Syntax
Plugin 'tpope/vim-fugitive'                     " Git Wrapper 
Plugin 'tpope/vim-sensible'                     " One step above 'nocompatible'
Plugin 'blarghmatey/split-expander'             " Resize split windows to text length
Plugin 'rking/ag.vim'                           " Searching in project
Plugin 'sjl/vitality.vim'                       " Vim play nicely iTerm and tmux
Plugin 'kien/ctrlp.vim'                         " File Finder
Plugin 'airblade/vim-gitgutter'                 " Show git diff in the gutter
Plugin 'vim-airline/vim-airline'                " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'         " Theme for vim-airline
Plugin 'tpope/vim-surround'                     " Change surroundings in pairs
Plugin 'vim-scripts/tComment'                   " Toggle comments
Plugin 'cakebaker/scss-syntax.vim'              " SCSS Syntax Highlight
Plugin 'christoomey/vim-tmux-navigator'         " Navigate seamlessly between vim and tmux splits
Plugin 'jgdavey/tslime.vim'                     " Send portion of text from a vim buffer to a running tmux session
Plugin 'jelera/vim-javascript-syntax'           " Advanced syntax highlight javascript
Plugin 'terryma/vim-expand-region'              " Visually select increasingly larger regions of text
Plugin 'maksimr/vim-jsbeautify'                 " Beautify code JS/JSX/CSS/HTML
Plugin 'myusuf3/numbers.vim'                    " Numbers for vim
Plugin 'jeetsukumaran/vim-buffergator'          " Change between buffers
Plugin 'majutsushi/tagbar'                      " Show class tags in sidebar
call vundle#end()            " required

filetype plugin indent on    " required

" #### End Vundle ####

set shell=/bin/bash
let $PATH='/usr/local/bin:' . $PATH
:au FocusLost * :wa "Save on focus lost

let mapleader=","
map <C-n> :NERDTreeToggle<CR>

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands


" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

set tabstop=4
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

colorscheme solarized
set background=dark
set encoding=utf-8

" Highlight line number of where cursor currently is
hi CursorLineNr guifg=#050505

" Show line Numbers
set number
set numberwidth=5

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy navigation between splits. Instead of ctrl-w + j. Just ctrl-j
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

" Buffer movements
nnoremap <leader>q :bprev<cr>
nnoremap <leader>w :bnext<cr>

" Mapping for CtrlP
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'
set t_Co=256

" GO Stuff

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


" For JS-Beautify
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


set guifont=Inconsolata:h16
