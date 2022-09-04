local status, nvim_lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status then
  return
end

local status, lspconfig = pcall(require, 'lspconfig')
if not status then
  return
end

nvim_lsp_installer.setup({
  -- automatically install language servers
  automatic_installation = true,
})

-- language server list
-- { key: language value: config }
-- lsp config path: lua/lsp/langs/*.lua
local servers = {
  sumneko_lua = require('user.lsp.configs.lua'),
  rust_analyzer = require('user.lsp.configs.rust'),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == 'table' then
    -- custom lsp must implement on_setup
    config.on_setup(lspconfig[name])
  else
    lspconfig[name].setup({})
  end
end
