" encoding                                                                                                                                   [40/98]
set encoding=utf8

" highlight
syntax on

" show line number
set number

" tab behavior tab = 4 spaces
set tabstop=4
set expandtab
set smarttab

" auto indent 4 spaces
set autoindent
set shiftwidth=4

" line wrap
set lbr
set lw=120
set wrap

" add a bit padding to left
set foldcolumn=1

" show matching brackets
set showmatch
set mat=2

" auto reload when file is changed outside vim
set autoread

" :W will sudo save the file
command W w !sudo tee % > /dev/null

" status line
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" show current position
set ruler

" command bar height
" set cmdheight=2

" map leader for quick key combos
let mapleader=","
nmap <leader>w :w!<cr>

" silence error sounds
set noerrorbells
set visualbell
set t_vb=
set tm=500

" turn off backup / swap
set nobackup
set nowb
set noswapfile

" helper functions
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" delete trailing white space on save, for specified filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.sh :call CleanExtraSpaces()
endif