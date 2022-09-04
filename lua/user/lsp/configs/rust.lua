-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
local opts = {
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),

  flags = {
    debounce_text_changes = 150,
  },

  on_attach = function(client, bufnr)
    -- disable format function, use specified plugin
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- bind keys
    require('user.keybindings').map_lsp(buf_set_keymap)
  end,

  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
}

return {
  on_setup = function(server)
    local ok, rust_tools = pcall(require, 'rust-tools')
    if not ok then
      server.setup(opts)
    else
      rust_tools.setup({
        server = opts,
        dap = require('user.debugger.rust'),
      })
    end
  end,
}
