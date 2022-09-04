-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- https://github.com/hrsh7th/nvim-cmp
local status, cmp = pcall(require, 'cmp')
if not status then
  return
end

local status, luasnip = pcall(require, 'luasnip')
if not status then
  return
end

cmp.setup({
  -- snippet engines
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- snippet sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  -- snippet shortcuts
  mapping = require('user.keybindings').cmp(cmp),
  -- lspkind show icons
  formatting = require('user.lsp.ui').formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
})
