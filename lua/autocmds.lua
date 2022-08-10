local auto_group = vim.api.nvim_create_augroup("autocmds_auto_group", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- nvim-tree auto close on wins count is 1 and not a nvimtree win
autocmd("BufEnter", {
  nested = true,
  group = auto_group,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

-- im auto select on insert leave and enter
-- need to install im-select:
-- https://github.com/daipeihust/im-select
-- autocmd("InsertLeave", {
--   group = auto_group,
--   callback = require("utils.im-select").macInsertLeave,
-- })
-- autocmd("InsertEnter", {
--   group = auto_group,
--   callback = require("utils.im-select").macInsertEnter,
-- })

-- insertion auto start on open term
autocmd("TermOpen", {
  group = auto_group,
  command = "startinsert",
})

-- formatting auto sync on save
autocmd("BufWritePre", {
  group = auto_group,
  pattern = { "*.lua", "*.py", "*.sh" },
  callback = vim.lsp.buf.formatting_sync,
})

-- plugins auto update on edit
autocmd("BufWritePost", {
  group = auto_group,
  -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
  callback = function()
    if vim.fn.expand("<afile>") == "lua/plugins.lua" then
      vim.api.nvim_command("source lua/plugins.lua")
      vim.api.nvim_command("PackerSync")
    end
  end,
})

-- highlighting auto open on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = auto_group,
  pattern = "*",
})

-- comments auto continue on enter key 'o' and 'r'
autocmd("BufEnter", {
  group = auto_group,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})
