-- load basic config
require('basic')

-- load color scheme
require('colorscheme')

-- load keybindings
require('keybindings')

-- load package manager
require('plugins')

-- load plugin config
require('plugin-config.nvim-tree')
require('plugin-config.telescope')
require('plugin-config.gitsigns')
require('plugin-config.fidget')

-- load auto commands 
require('autocmds')

-- load language manager
require('lsp/setup')
require('lsp/cmp')
require('lsp/ui')
require('lsp/fmt')

-- load debugging adapter
require('dap.nvim-dap')

