" Not vi-compatible
set nocompatible

" ----------------------------------------
" Vundle
" ----------------------------------------
source $HOME/.vim-bundles

" ----------------------------------------
" Settings
" ----------------------------------------

" Change the mapleader from \ to <Space>
let mapleader="\<Space>"

" General
syntax enable             " Syntax highlighting
set history=1000          " Store a ton of history (default is 20)
set hidden                " Allow buffer switching without saving
set number                " Display line numbers
set cursorline            " Highlight the current line
set laststatus=2
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set ruler
set nowrap                " Don't wrap text by default
set nowritebackup
set noswapfile
set nobackup
set incsearch
set hlsearch
set ignorecase
set showmatch
set matchtime=2
set autoindent
set showcmd               " Show partial commands on status line
set encoding=utf-8        " Set file encoding to utf-8
set autowrite             " Save on buffer switch
set autoread              " Check when a file is edited by another program
set visualbell            " Disable beeping and visual notification
set updatetime=250        " Lower update time to 250 ms

" Colors
colorscheme solarized
let g:solarized_termtrans=1
set background=dark

" Automatically set the background based on the time of day
" Thanks to Benjamin Tan: http://goo.gl/UcErBh
let hour = strftime("%H")
if 6 <= hour && hour < 18
    set background=light
else
    set background=dark
endif

" Set cursor shape
if &term =~ '^xterm'
" blinking underscore
    let &t_SI .= "\<Esc>[3 q"
endif

" Allow backspacing over everything
set backspace=indent,eol,start

" Quick ESC from insert mode
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" Switch windows with Ctrl + a movement key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize buffers
if bufwinnr(1)
    nmap Ä <C-W>< <C-W><
    nmap Ö <C-W>> <C-W>>
    nmap ö <C-W>- <C-W>-
    nmap ä <C-W>+ <C-W>+
endif

" format the entire file
nmap <leader>fef ggVG=

" Upper/lowercase the word
nmap <silent> <leader>u mQviwU`Q
nmap <silent> <leader>l mQviwu`Q

" Upper/lowercase first character of word
nmap <silent> <leader>U mQgewvU`Q
nmap <silent> <leader>L mQgewvu`Q

" Clear highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Map the buffer list
nmap <leader>b :ls

" Fast saves
nmap <leader>w :w!<cr>

" Edit composer.json
nmap <leader>lc :e composer.json<cr>

" Find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Rapidly toggle 'set list'
nmap <leader>ll :set list!<CR>

" Key for paste mode
nmap <leader>pp :set paste!<CR>

" Toggle line numbers
nmap <leader>nn :set nonumber!<CR>

" make external keypad work in terminal vim OSX
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -

" Forget sudo?
cmap w!! w !sudo tee % >/dev/null

" Remap ':' to ';' - Saves two strokes
nnoremap ; :

" Quickly open the vim config file in a new tab.
nmap <leader>v :tabedit $MYVIMRC<CR>

" Enable filetype detection
if has("autocmd")
    filetype plugin indent on
endif

" File Types
if has("autocmd")
    autocmd BufRead,BufNewFile {*.sql}                                  set ft=pgsql
    autocmd BufRead,BufNewFile {*.haml}                                 set ft=haml
    autocmd BufRead,BufNewFile {*.rss,*.atom}                           set ft=xml
    autocmd BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,*.ru}   set ft=ruby
    autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                  set ft=markdown
    autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                         set ft=gitcommit
endif

" Indentation
if has("autocmd")
    autocmd FileType sh,bash setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype ruby setlocal tw=80 ts=2 sts=2 sw=2 expandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
endif

" Markdown
if has("autocmd")
    autocmd FileType markdown set wrap
    autocmd FileType markdown set linebreak
endif

" Editing
if has("autocmd")
    " Strip trailing white space on specific files
    autocmd BufWritePre *.php,*.phtml,*.rb,*.htm,*.html,*.css,*.py,*.js :%s/\s\+$//ge

    " Go back to the position the cursor was on the last time this file was edited
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif
endif

" PHP
if has("autocmd")
    " Highlight interpolated variables in SQL strings & SQL-syntax highlighting
    autocmd FileType php let php_sql_query=1

    " Highlight HTML inside of PHP strings
    autocmd FileType php let php_htmlInStrings=1

    " Discourages use of short tags.
    autocmd FileType php let php_noShortTags=1
endif
