call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua', { 'branch': 'main' } 
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'folke/zen-mode.nvim'
Plug 'kshenoy/vim-signature'
Plug 'https://github.com/alok/notational-fzf-vim'
call plug#end()

set ignorecase
set smartcase
set scrolloff=16
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
set whichwrap+=<,>,h,l,[,]
set signcolumn=yes
set updatetime=200
set termguicolors
colorscheme LittleComputerPeople

command! -bang -nargs=* BLinesNosort 
        \ call fzf#vim#buffer_lines(<q-args>, {'options': ['--no-sort']}, <bang>0)

let g:nv_search_paths = ['~/Documents/notes', './doc', './notes']

let mapleader=","
map <Leader>f :FzfLua files<CR>
map <Leader>b :FzfLua buffers<CR>
map <Leader>s :FzfLua lgrep_curbuf<CR>
map <Leader>u :UndotreeToggle<CR>
map <Leader>z :Zen<CR>
map <Leader>n :NV<CR>

set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

augroup wrapping
  autocmd!
  autocmd FileType markdown,md  call WrapOn()
  autocmd FileType text         call WrapOn()
augroup END

let g:vim_markdown_folding_disabled = 1

command! -bang -nargs=* WordReport call WordReport() 
command! -bang -nargs=* WrapOn call WrapOn() 
command! -bang -nargs=* WrapOff call WrapOff() 

function WrapOn()
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    setlocal display+=lastline
    set breakat&vim
    set breakat-=?
    set breakat-=!
    set breakat-=.
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction

function WrapOff()
    echo "Wrap OFF"
    setlocal nowrap
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
endfunction

function! WordReport()
    let ca = "git diff --word-diff=porcelain | grep '^+' | sed 's/^+//' | tail -n +2 | wc -w"
    let cd = "git diff --word-diff=porcelain | grep '^-' | sed 's/^-//' | tail -n +2 | wc -w"
    let added = trim(system(ca))
    let deleted = trim(system(cd))
    echo "Added " . added . " words. Deleted " . deleted . " words."
endfunction

lua << EOF
    require("zen-mode").setup {
        window = {
            width = 65,
            height = 0.8
        }
    }
EOF
