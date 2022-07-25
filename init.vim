syntax enable
filetype plugin indent on

" load packer for package management
lua require('plugins')

let mapleader=","

" load language server
lua require('lsp/setup')

" load language completion
lua require('lsp/nvim-cmp')

" ======================================
" rust config
" ======================================
let g:rust_clip_command = 'pbcopy'

