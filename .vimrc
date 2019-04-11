set nocompatible " use vim and do not behave like vi
filetype off " Deactivate filetype plugin temporarily

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
" Themes
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
" Tools integration
Plugin 'tpope/vim-fugitive' " Git status integration
Plugin 'scrooloose/nerdtree' " NERDTree to display project's files tree
" Syntax checking
Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
" UI
Plugin 'vim-airline/vim-airline' " Airline
Plugin 'enricobacis/vim-airline-clock' " Date and time in vim airline
Plugin 'tmux-plugins/vim-tmux-focus-events' " Autoreload
" Language specific
Plugin 'mattn/emmet-vim' " HTML snippets
Plugin 'mxw/vim-jsx' " JSX syntax highlighting
Plugin 'lumiliet/vim-twig' " Twig syntax highlighting
Plugin 'posva/vim-vue' " VueJS
" Fuzzy finder
Plugin 'junegunn/fzf'
" Org-Mode
Plugin 'jceb/vim-orgmode'
" Editor configuration sharing
Plugin 'editorconfig/editorconfig-vim'
" Dev Icons (must be the very last loaded plugin)
Plugin 'ryanoasis/vim-devicons'
call vundle#end()

filetype plugin indent on " Enable filetype plugin again
syntax on " Enable syntax highlighting
set laststatus=2 " Always show the statusline
set encoding=utf-8
set number " Display line number
set ts=4 sts=4 sw=4 expandtab " tab = 4 spaces for every file type
" tab = 2 spaces for web programming languages, JSON, YAML and Markdown
autocmd Filetype c,cpp,css,html,htmldjango.twig,html.twig,javascript,json,php,scss,twig,ruby,yaml,vim,xml set ts=2 sts=2 sw=2 expandtab
" Display whitespaces with specific characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list " Display white space characters
set mouse=a " Enable mouse use (yeah it's bad)
set cursorline " Highlight cursor's current line
set splitbelow
set splitright
set pastetoggle=<F2>
colorscheme gruvbox
set background=dark

" Gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Buffer navigation
nnoremap <silent> <F8> :bn<CR>
nnoremap <silent> <F7> :bp<CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Ctags
:command MakeTags !ctags -R .

" Buffers
:command BufOnly %bd|e#<CR>

" Window sizing
:command WLarger vertical resize +10
:command WThinner vertical resize-10
:command WHigher resize +10
:command WShorter resize +10

" emmet-vim (HTML snippets)
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
autocmd FileType html,css,js,javascript.jsx,twig,php,markdown,html.twig,htmldjango.twig,xml,vue EmmetInstall

" Code formatters
autocmd Filetype sh set equalprg=shfmt\ -i\ 4
autocmd Filetype python set equalprg=yapf
autocmd Filetype javascript,javascript.jsx set equalprg=prettier\ --parser=babylon
autocmd Filetype json set equalprg=prettier\ --parser=json
autocmd Filetype css,scss,less set equalprg=prettier\ --parser=css
autocmd Filetype yaml set equalprg=prettier\ --parser=yaml
autocmd Filetype markdown set equalprg=tidy-markdown
autocmd Filetype c,cpp set equalprg=clang-format\ --style=Google
autocmd Filetype html set equalprg=html-beautify\ --indent-size=2\ --no-preserve-newlines\ -
autocmd Filetype xml set equalprg=xmllint\ --format\ -

" Syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'passive',
                            \ 'active_filetypes': [''],
                            \ 'passive_filetypes': ['*'] }
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
let g:syntastic_rst_checkers = ['sphinx']

" Syntax Higlighting for odd files extensions
" autocmd BufNewFile,BufRead *.twig set syntax=htmldjango.twig
autocmd BufRead,BufNewFile *.vue set syntax=html

" File search
set path+=**
set wildmenu

" Autoreload
" set autoread
au FocusGained,BufEnter * :checktime " https://vi.stackexchange.com/questions/444/how-do-i-reload-the-current-file/13092#13092

" Airline
" let g:airline_powerline_fonts = 1

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
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_theme = 'gruvbox' " Sets the airline theme

" Airline clock
let g:airline#extensions#clock#format = '%a %d %B %H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000 " Update the clock every second

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" EditorConfig
" Ensure EditorConfig plugin works well with vim-fugitive plugin and
" avoid loading EditorConfig for any remote files over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
" (https://sunaku.github.io/vim-256color-bce.html)
set t_ut=

" Nasty GUI hacks
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Input\ Mono\ Nerd\ Font\ 12
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h11:cDEFAULT
  endif
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" urxvt transparency hack
if $TERM == "rxvt-unicode-256color"
    hi Normal ctermbg=NONE
endif
