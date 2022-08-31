-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify('Installing pakcer.nvim，please wait...')
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath('data') .. '/site/pack/*/start/*'
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
  end
  vim.notify('Successfully install pakcer.nvim!')
end

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, 'packer')
if not ok then
  vim.notify('Not found installed packer.nvim!')
  return
end

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Bootstrap Dashboard
  use('glepnir/dashboard-nvim')

  -- Notification enhance
  use('rcarriga/nvim-notify')

  -- File explorer
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- File formatter
  use('mhartington/formatter.nvim')
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- File fizz finder
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  })
  use('LinArcX/telescope-env.nvim')
  use('nvim-telescope/telescope-ui-select.nvim')

  -- Colorschemes
  use('EdenEast/nightfox.nvim')

  -- LSP and completion
  use({
    -- Language server installer
    'williamboman/nvim-lsp-installer',

    -- Language server configuration
    'neovim/nvim-lspconfig',

    -- Autocompletion engine
    'hrsh7th/nvim-cmp',

    -- Autocompletion source
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',

    -- Snippet engine
    'hrsh7th/vim-vsnip',

    -- Snippet source
    'hrsh7th/cmp-vsnip',

    -- UI enhance
    'onsails/lspkind-nvim',
    'tami5/lspsaga.nvim',

    -- Lua enhance
    'folke/lua-dev.nvim',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',

    -- Rust enhance
    'simrat39/rust-tools.nvim',

    -- TypeScript enhance
    'jose-elias-alvarez/nvim-lsp-ts-utils',

    -- JSON enhance
    'b0o/schemastore.nvim',
  })

  -- Debugging adapter
  use({
    'mfussenegger/nvim-dap',
    'theHamsta/nvim-dap-virtual-text',
    'rcarriga/nvim-dap-ui',
  })

  -- Git integration
  use('lewis6991/gitsigns.nvim')

  -- Lsp progress
  use('j-hui/fidget.nvim')

  -- Sync while installing
  if packer_bootstrap then
    packer.sync()
  end
end)
