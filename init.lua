-- load basic config
require('basic')

-- load color scheme
require('colorscheme')

-- load keybindings
require('keybindings')

-- load package manager
require('plugins')

-- load plugin config
require('plugin-config.dashboard')
require('plugin-config.notify')
require('plugin-config.nvim-tree')
require('plugin-config.telescope')
require('plugin-config.gitsigns')
require('plugin-config.fidget')

-- load auto commands
require('autocmds')

-- load language manager
require('lsp.setup')
require('lsp.cmp')
require('lsp.fmt')
require('lsp.ui')

-- load debugging adapter
require('dap.nvim-dap')
