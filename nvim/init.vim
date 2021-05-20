call plug#begin(stdpath('data') . '/plugged')
Plug 'reedes/vim-pencil'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'folke/zen-mode.nvim'
Plug 'kshenoy/vim-signature'
Plug 'romainl/flattened'
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

let mapleader=","
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>l :BLines<CR>
map <Leader>r :Rg<CR>
map <Leader>z :Zen<CR>

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" LUA conf
lua << EOF
    require("zen-mode").setup {
        window = {
            width = 60,
            height = 0.8
        },
        options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
        }
    }
EOF
