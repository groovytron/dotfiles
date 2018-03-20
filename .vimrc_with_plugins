set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
" Plugin 'beyondmarc/glsl.vim'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Quramy/tsuquyomi'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lumiliet/vim-twig'
Plugin 'cespare/vim-toml'
Plugin 'tpope/vim-fugitive'
Plugin 'mindriot101/vim-yapf'
Plugin 'dpelle/vim-Grammalecte' " French grammar check
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'prettier/vim-prettier'
Plugin 'vim-scripts/BufOnly.vim'

" Autoreload
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Themes
Plugin 'joshdick/onedark.vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'MaxSt/FlatColor'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'alessandroyorba/monrovia'
" Plugin 'morhetz/gruvbox'
" Plugin 'alessandroyorba/sidonia'

" Personnal markdown plugin
Plugin 'groovytron/vim-tidymarkdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

syntax on
filetype plugin indent on
set laststatus=2 " Always show the statusline
set encoding=utf-8
set number
set ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript,json,html,twig,ruby,yaml,markdown,css set ts=2 sts=2 sw=2 expandtab
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
set mouse=a

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:neocomplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" Sets the airline theme
let g:airline_theme='onedark'


" Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_rst_checkers = ['sphinx']

" HTML emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,javascript.jsx,html.twig,php,markdown EmmetInstall

" Keybindings
set pastetoggle=<F2>
nnoremap <silent> <F8> :bn<CR>
nnoremap <silent> <F7> :bp<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Basic commands customization
set splitbelow

" Autoreload
" set autoread
au FocusGained,BufEnter * :checktime " https://vi.stackexchange.com/questions/444/how-do-i-reload-the-current-file/13092#13092

" JSX
let g:jsx_ext_required = 0

" spell checking
let g:grammalecte_cli_py='/home/julien/grammalecte/cli.py'

if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h11:cDEFAULT
  endif
  colorscheme onedark
else
  " colorscheme flatcolor
  colorscheme onedark
endif

" urxvt transparency hack
if $TERM == "rxvt-unicode-256color"
    hi Normal ctermbg=NONE
endif
