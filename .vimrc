set nocompatible              " be iMproved, required

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" -------------- PLUGINS ----------------

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ------- PLUGINS::UTILITIES ---------

" Surround code
Plugin 'tpope/vim-surround'
" Git utils
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" easy paste
Plugin 'ConradIrwin/vim-bracketed-paste'

"
" ------- PLUGINS::STATUSES ------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Git gutter - shows diff on the left to rule
Plugin 'airblade/vim-gitgutter'
Plugin 'jreybert/vimagit'

" ------- PLUGINS::FUNCTIONS -----
" Nerd tree - file browser
Plugin 'scrooloose/nerdtree'
" Ctrl+P - fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'
" Enable easy tabs
Plugin 'godlygeek/tabular'
" UB - history window
Plugin 'chrisbra/histwin.vim'
" Vim Ferret - search for files
Plugin 'wincent/ferret'

" -- PLUGINS::THEMES AND HIGHLIGHT --
" Solorized theme 
Plugin 'sheerun/vim-polyglot'
Plugin 'altercation/vim-colors-solarized'
Plugin 'NewProggie/NewProggie-Color-Scheme'
Plugin 'tomtom/tcomment_vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'felixhummel/setcolors.vim'
Plugin 'flazz/vim-colorschemes' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on

" --------- MISC ---------
set encoding=utf-8
set laststatus=2 

" Set workdir as file diar
" set acd
autocmd BufEnter * silent! lcd %:p:h
" Put plugins and dictionaries in this dir (also on Windows)
set undofile                " Save undo's after file closes

set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

set number
set ruler
" ------ MISC::INDENT ----

set autoindent
" Show existing tab with 2 spaces width
set tabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert spaces
set expandtab

" --- THEMES AND HIGHLIGHT ---

set background=light
syntax enable
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
" let g:airline_theme='onedark'
" Solarized theme
let g:solarized_contrast="high"
" Remap solarized background switch key
let g:solarized_termcolors=256
colorscheme solarized

" --- STATUSES::AIRLINE ---
let g:airline#extensions#tabline#enabled = 1

let g:undo_tree_dtl = 0
let NERDTreeShowHidden=1

" --- PLUGINS ---
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'




" ------------- KEYBOARD ----------

" --- KEYBOARD::CORE ---
" [!] Remap escape sequences to sane values
map <ESC>[5B <C-down>
map <ESC>[5A <C-up>
map <ESC>[5D <C-left>
map <ESC>[5C <C-right>

" [*] Leader remapping to a wide key
nmap <Space> <Leader>

" [*] General remapping
set timeout
set timeoutlen=300
set ttimeoutlen=100

" [+] Enable word warping by keyboard
set whichwrap+=>,l
set whichwrap+=<,h

" [!] Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" [+] Enable full backspace
set backspace=indent,eol,start
inoremap <C-BS> <C-W>

" [+] Enable autocomplete for all
set omnifunc=syntaxcomplete#Complete

" --- KEYBOARD::NICETIES ---
" [+] Open NerdTree
map <C-n> :NERDTreeToggle<CR>

" [+] Open UB/UNDO tree
nnoremap <Leader>t :UB<cr>

" [+] Follow vertical
map <F7> :vertical wincmd f<CR>

" [+] Enable visual find
vnoremap // y/<C-R>"<CR>

" [?] Enable paste undo
" inoremap <C-R> <C-G>u<C-R>

" [+] Allow to hide line numbers by pressing LEADER-N twice
inoremap <Leader>n <C-o>:set invnumber<CR>
nnoremap <Leader>n :set invnumber<CR>

" [+] Resize splits
noremap <Leader>] :exe "vertical resize " . (winwidth(0) * 12/10)<CR>
noremap <Leader>[ :exe "vertical resize " . (winwidth(0) * 10/12)<CR>
noremap <Leader>e <C-W>\|
noremap <Leader>w 1<C-W>\|
noremap <Leader>s <C-W>=

" [+] enable goto visual inside insert
inoremap <C-v> <C-o><C-v>

" [+] new line
nmap OO m`O<Esc>``
nmap oo m`o<Esc>`` 
imap <C-d> <C-o>diw
nmap <C-d> daw

" [+] Duplicate lines
nnoremap ,, @='mqYp'<cr>
imap <C-down> <C-o>,,
imap <C-up> <C-o>,,


" --- KEYBOARD::WEIRD STUFF (but I like it) ---

" [!] Move lines up or down
nnoremap <A-up> :m-2<CR>
inoremap <A-up> <Esc>:m-2<CR>
vnoremap <A-up> :m'<-2<CR>gv=`>my`<mzgv`yo`z
nnoremap <A-down> :m+<CR>
vnoremap <A-down> :m'>+<CR>gv=`<my`>mzgv`yo`z
inoremap <A-down> <Esc>:m+<CR>

" [+] visually jump in normal mode
noremap <C-up> 5k
noremap <C-down> 5j

" [!] tabulation
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" [!] Enable buffer movements
nnoremap <A-right> :bn<CR>
nnoremap <A-left> :bp<CR>
inoremap <A-left> <ESC>:bp<CR>i
inoremap <A-right> <ESC>:bn<CR>i
nnoremap <A-r> <C-6>
inoremap <A-r> <ESC><C-^>

" [!] Split movements
nnoremap <A-Down><A-Down> <C-W>j
nnoremap <A-Up><A-Up> <C-W>k

nnoremap <A-Right><A-Right> <C-W>w
nnoremap <A-Left><A-Left> <C-W><Left>
inoremap <A-Left><A-Left> <ESC><C-W><Left>i
inoremap <A-Right><A-Right> <ESC><C-W>wi

" [+] Save in insert
inoremap <F5> <C-o>:w<cr>

" [+] Disable highlight
let hlstate=0
nnoremap <F3> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
inoremap <F3> <C-o>:if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" [?] Open tab
nnoremap <C-e><C-e> :tabnew<CR>

" [?] Close tab
nnoremap <C-s> :tabclose<CR>
inoremap <C-s> <C-o>:tabclose<CR>

" [?] CD to current dir
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>


" [!] New splits (in console, M do not work, use A-left, A-right)
nnoremap <C-Right> <C-w>v<CR>
" [!] Close split
nnoremap <C-Left> :clo<CR>
" [!] Close buffer
nnoremap <C-Left><C-Left> :bp<bar>sp<bar>bn<bar>bd<CR>

" -------- MORE WEIRD STUFF (NOW WITH FUNCTIONS!) ------------

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

" [!] Paste over visual selection
" NB: this supports "rp that replaces the selection by the
" contents of @r
vnoremap <silent> <expr> p <sid>Repl()



" --- MORE WEIRD STUFF::AUTOMATION ---
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


" [!] Keep undo history across sessions by storing it in a file
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


