-- https://github.com/L3MON4D3/LuaSnip
local status, luasnip = pcall(require, 'luasnip')
if not status then
  return
end

local options = {
  history = true,
  updateevents = 'TextChanged,TextChangedI',
}

luasnip.config.set_config(options)

require('luasnip.loaders.from_vscode').lazy_load()
