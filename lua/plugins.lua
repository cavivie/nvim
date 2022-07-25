-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and completion
  use {
    -- Language server installer
    'williamboman/nvim-lsp-installer',

    -- Language server configuration
    'neovim/nvim-lspconfig',

    -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- Snippets source
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',

    -- Language protocol kind
    'onsails/lspkind-nvim'
  }

  -- Rust language support
  -- use { 'rust-lang/rust.vim' }
end)
