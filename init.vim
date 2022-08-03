syntax enable
filetype plugin indent on

" load color scheme
lua require('colorscheme')

" load keybindings
lua require('keybindings')

" load package manager
lua require('plugins')

" load plugin config
lua require('plugin-config.nvim-tree')
lua require('plugin-config.telescope')
lua require('plugin-config.gitsigns')
lua require('plugin-config.fidget')

" load auto commands 
lua require('autocmds')

" load language manager
lua require('lsp/setup')
lua require('lsp/cmp')
lua require('lsp/ui')
lua require('lsp/fmt')

" load debugging adapter
lua require('dap.nvim-dap')

" ======================================
" rust config
" ======================================
let g:rust_clip_command = 'pbcopy'

