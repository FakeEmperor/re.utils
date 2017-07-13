set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
" Git plugin not hosted on GitHub

Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Status themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"  
"  " Autocomplete
Plugin 'Valloric/YouCompleteMe'

" Vim Ferret - search for files
Plugin 'wincent/ferret'
"
" Git gutter - shows diff on the left to rule
Plugin 'airblade/vim-gitgutter'
" Nerd tree - file browser
Plugin 'scrooloose/nerdtree'
" Ctrl+P - fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'
" Enable easy tabs
Plugin 'godlygeek/tabular'
" UB - history window
Plugin 'chrisbra/histwin.vim'
" easy paste [ need to test ]
Plugin 'ConradIrwin/vim-bracketed-paste'


"" Themes here
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
" Plugin 'nightsense/night-and-day' 
" Solorized theme 
Plugin 'nightsense/seabird'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim'
Plugin 'exitface/synthwave.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NewProggie/NewProggie-Color-Scheme'
Plugin 'tomtom/tcomment_vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'jreybert/vimagit'
Plugin 'felixhummel/setcolors.vim'
Plugin 'flazz/vim-colorschemes' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on


" Indentation
set autoindent
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

set background=light
syntax enable
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


" Set colour theme
"
" Synthwave Theme (looks awful in 8bit term)
" colorscheme onedark
" colorscheme synthwave
" if has('termguicolors')
"     set termguicolors " 24-bit terminal
" else
"     let g:synthwave_termcolors=256 " 256 color mode
" endif

" let g:airline_theme='onedark'
" Solarized theme
let g:solarized_contrast="high"
" Remap solarized background switch key
let g:solarized_termcolors=256
colorscheme solarized

" New Proggie scheme
" color newproggida

"" Vim Airline thingies
" ------------- Plugin configs ----------
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set laststatus=2 
let g:undo_tree_dtl = 0
let NERDTreeShowHidden=1
" ------------- Keyboard mappings ----------
" Enable word warping
set whichwrap+=>,l
set whichwrap+=<,h
" Enable full backspace
set backspace=indent,eol,start
inoremap <C-BS> <C-W>
" Enable autocomplete for all
set omnifunc=syntaxcomplete#Complete

" General remapping
set timeout
set timeoutlen=300
set ttimeoutlen=100

nmap <Space> <Leader>

" Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" Follow vertical
map <F7> :vertical wincmd f<CR>

" Remap escape sequences to sane values
map <ESC>[5B <C-down>
map <ESC>[5A <C-up>
map <ESC>[5D <C-left>
map <ESC>[5C <C-right>

" Enable visual find
vnoremap // y/<C-R>"<CR>

" Enable paste undo
" inoremap <C-R> <C-G>u<C-R>

" Move lines up or down
nnoremap <A-up> :m-2<CR>
inoremap <A-up> <Esc>:m-2<CR>
vnoremap <A-up> :m'<-2<CR>gv=`>my`<mzgv`yo`z
nnoremap <A-down> :m+<CR>
vnoremap <A-down> :m'>+<CR>gv=`<my`>mzgv`yo`z
inoremap <A-down> <Esc>:m+<CR>

" visually jump in normal mode
noremap <C-up> 5k
noremap <C-down> 5j

" tabulation
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Enable buffer movements
nnoremap <A-right> :bn<CR>
nnoremap <A-left> :bp<CR>
inoremap <A-left> <ESC>:bp<CR>i
inoremap <A-right> <ESC>:bn<CR>i
nnoremap <A-r> <C-6>
inoremap <A-r> <ESC><C-^>

" Undo tree
nnoremap <Leader>t :UB<cr>

" Resize splits

noremap <Leader>] :exe "vertical resize " . (winwidth(0) * 12/10)<CR>
noremap <Leader>[ :exe "vertical resize " . (winwidth(0) * 10/12)<CR>
noremap <Leader>e <C-W>\|
noremap <Leader>w 1<C-W>\|
noremap <Leader>s <C-W>=

" Split movements
nnoremap <A-Down><A-Down> <C-W>j
nnoremap <A-Up><A-Up> <C-W>k

nnoremap <A-Right><A-Right> <C-W>w
nnoremap <A-Left><A-Left> <C-W><Left>
inoremap <A-Left><A-Left> <ESC><C-W><Left>i
inoremap <A-Right><A-Right> <ESC><C-W>wi

" enable goto visual inside insert

inoremap <C-v> <C-o><C-v>

" new line
nmap OO m`O<Esc>``
nmap oo m`o<Esc>`` 
imap <C-d> <C-o>diw
nmap <C-d> daw

" Save in insert
inoremap <F5> <C-o>:w<cr>

" Disable highlight
let hlstate=0
nnoremap <F3> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
inoremap <F3> <C-o>:if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" Open tab
nnoremap <C-e><C-e> :tabnew<CR>

" Close tab
nnoremap <C-s> :tabclose<CR>
inoremap <C-s> <C-o>:tabclose<CR>
" Duplicate lines
nnoremap ,, @='mqYp'<cr>
" nnoremap , @='mqYP'<cr>
imap <C-down> <C-o>,,
imap <C-up> <C-o>,,

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" Disable paste-over register replace
" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
 let s:restore_reg = @"
 return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the
" contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" New splits (in console, M do not work, use A-left, A-right)
nnoremap <C-Right> <C-w>v<CR>
nnoremap <C-Left> :clo<CR>
" :bd<CR>:vert belowright sbp<CR>
nnoremap <C-Left><C-Left> :bp<bar>sp<bar>bn<bar>bd<CR>




" ------------- Automation -----------
" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) | 
  \ call mkdir($HOME . "/.vim") |
  \ endif |
  \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

"  Remember last edited line and jump to it
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set workdir as file diar
" set acd
autocmd BufEnter * silent! lcd %:p:h
" Put plugins and dictionaries in this dir (also on Windows)
set undofile                " Save undo's after file closes

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let vimDir = '$HOME/.vim'
    let myUndoDir = expand(vimDir . '/undodir')
    let &undodir = myUndoDir
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    set undofile
endif
"  
"  
"  
" ------------ Screen space -----------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  " Use ~x on an English Windows version or ~n for French.
  au GUIEnter * simalt ~x 
  " or use this line for non-windows OS
  " set lines=999 columns=999
else
  " This is console Vim.
endif


" 
" Misc
set number
set ruler


