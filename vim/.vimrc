""""""""""""""""""""""""""""""""""""""""""""""""""
"              general setting                   "
""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on " syntax highlight

filetype on " enable filetype detected
filetype plugin on " enable file plugins
filetype indent on " enable file indent

set number " show the line number
set ruler " show the additional information
set list " Show some special characters
set tabstop=2 " the spaces number of <Tab>
set softtabstop=2 " number of spaces while using <Tab>
set shiftwidth=2 " number of spaces to use for each step of indent
set smartindent " smart autoindent
set nobackup " do not make a backup
set noswapfile " do not use a swapfile
set expandtab " use the appropriate number of spaces to insert a <Tab>
set showcmd " show the command in the right bottom
set showmatch " jump to matched briefly
set nocompatible " do not make vi-compatible
set cursorline " hightlight current line
set nocursorcolumn " do not hightlight current column
set colorcolumn=81 " show the right ruler
set hlsearch " highlight search results
set autoread " autoread when changed outside vim
set ignorecase " ignore case while searching
set undofile " enable persistent undo
set mouse=a " enable mouse
set splitbelow " split window to below
set backspace=indent,eol,start " make backspace work better
set noshowmode " Do not show mode
set encoding=UTF-8 " encode with UTF-8
set termguicolors " enable true color support
set background=dark " enable dark mode

autocmd FileType make set noexpandtab " do not expandtab while editing Makefile
autocmd FileType go set noexpandtab " do not expandtab while editing Go

""""""""""""""""""""""""""""""""""""""""""""""""""
"              undodir setting                   "
""""""""""""""""""""""""""""""""""""""""""""""""""

let s:undo_dir = expand('~/.vim/undodir') " undofiles stored position

" create the directory if not exists
if !isdirectory(s:undo_dir)
  silent! call mkdir(s:undo_dir, 'p')
endif

let &undodir = s:undo_dir " set the undodir

""""""""""""""""""""""""""""""""""""""""""""""""""
"              vim-plug setting                  "
""""""""""""""""""""""""""""""""""""""""""""""""""

" install vim-plug automatically if not exists
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/LeaderF'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
"              Gruvbox  setting                  "
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gruvbox_bold = 1 " Bold text
let g:gruvbox_italic = 0 " Disable italic text
let g:gruvbox_underline = 1 " Underline text
let g:gruvbox_undercurl = 1 " Undercurl text
let g:gruvbox_termcolors = 256 " 256 palette
let g:gruvbox_improved_strings = 1 " Extrahighlighted strings
let g:gruvbox_improved_warnings = 1 " Extrahighlighted warnings
let g:gruvbox_contrast_dark = 'soft' " Gruvbox dark mode
let g:gruvbox_italicize_comments = 1 " Italicize comments

colorscheme gruvbox " Colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""
"              NERDtree setting                  "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeWinSize = 30 " Change NERDTree window size
let g:NERDTreeShowHidden = 1 " Show hiddent files
let NERDTreeCascadeSingleChildDir = 0 " Not collapse dir
let NERDTreeCascadeOpenSingleChildDir = 0 " Not cascade open dir

" NERDTree toggle shortcur
noremap <F2> :NERDTreeToggle<CR><C-W>p

" Change symbols
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""
"          NERDCommenter setting                 "
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable check

" Map to <C-/>
map <C-_> <plug>NERDCommenterToggle

""""""""""""""""""""""""""""""""""""""""""""""""""
"                LeaderF setting                 "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Map F3
noremap <F3> :LeaderfBufTag<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"              Airline setting                   "
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 0 " Integrating with powerline fonts
let g:airline#extensions#tabline#enabled = 1 " Beautify tab line
let g:airline_theme = 'gruvbox' " Airline Theme

""""""""""""""""""""""""""""""""""""""""""""""""""
"                Rainbow setting                 "
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_conf = {
      \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \	'operators': '_,_',
      \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \	'separately': {
      \		'*': {},
      \   'cmake': 0,
      \	}
      \}

let g:rainbow_active = 1 " Run automatically

""""""""""""""""""""""""""""""""""""""""""""""""""
"           YouCompleteMe setting                "
""""""""""""""""""""""""""""""""""""""""""""""""""

set completeopt-=preview " Close preview window

let g:ycm_complete_in_strings = 1 " Complete string
let g:ycm_complete_in_comments = 1 " Complete string
let g:ycm_min_num_identifier_candidate_chars = 2 " Minimun char nums
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " Scan id from comments and strings
let g:ycm_collect_identifiers_from_tags_files = 1 " Scan id from tags
" let g:ycm_key_invoke_completion='<C-Z>' " Custom key bind
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" Apply YCM FixIt
noremap <leader>f<space> :YcmCompleter FixIt<CR>
