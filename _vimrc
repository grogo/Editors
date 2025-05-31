set ignorecase
set smartcase
set number
"set relativenumber
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
syntax on
"automatically reload on change
set autoread

" map gn and gp to next/prev buffer. gd to delete current buff
map gn :bnext<cr>
map gp :bprevious<cr>
map gd :bdelete<cr>  

" map Ctrl-L to clear and center screen and clear search highlights
nnoremap <C-L> :nohlsearch<CR>zz<C-L>
" map Q to close buffer
nnoremap q :bdelete<CR>
