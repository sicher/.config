call plug#begin(stdpath('data') . '/plugged')
Plug 'reedes/vim-pencil'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'folke/zen-mode.nvim'
Plug 'kshenoy/vim-signature'
Plug 'romainl/flattened'
Plug 'overcache/NeoSolarized'
Plug 'preservim/vim-colors-pencil'
call plug#end()

set ignorecase
set smartcase
set scrolloff=10
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set signcolumn=yes
set updatetime=1000
if has("gui_vimr")
    set termguicolors
endif
set background=light
colorscheme pencil

command! -bang -nargs=* BLinesNosort
    \ call fzf#vim#buffer_lines(<q-args>, {'options': ['--no-sort']}, <bang>0)

let mapleader=","
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>s :BLinesNosort<CR>
map <Leader>r :Rg<CR>
map <Leader>u :UndotreeToggle<CR>
map <Leader>z :Zen<CR>

set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

let g:vim_markdown_folding_disabled = 1
  
" LUA conf
lua << EOF
    require("zen-mode").setup {
        window = {
            width = 60,
            height = 0.8
        }
    }
EOF

" Customize fzf colors to match your color scheme                                          
" - fzf#wrap translates this to a set of `--color` options                                 
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'CursorLine'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Normal'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

