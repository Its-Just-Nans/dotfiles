set number

" show tabulations
set list
" Disable arrow keys in Normal, Visual, Select, and Operator-pending modes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Disable arrow keys in Insert and Command-line modes
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Disable arrow keys in visual mode
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>

" no mouse
set mouse=

set backspace=

set relativenumber
set number

if !exists('$I3SOCK')
" transparent bg
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
endif

set expandtab "use only space
