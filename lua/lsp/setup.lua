require('nvim-lsp-installer').setup({
  -- automatically install language servers
  automatic_installation = true,
})

local lspconfig = require('lspconfig')

-- language server list
-- { key: language value: config }
-- lsp config path: lua/lsp/langs/*.lua
local servers = {
  sumneko_lua = require('lsp.langs.lua'),
  rust_analyzer = require('lsp.langs.rust'),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == 'table' then
    -- custom lsp must implement on_setup
    config.on_setup(lspconfig[name])
  else
    lspconfig[name].setup({})
  end
end
