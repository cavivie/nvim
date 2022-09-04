-- https://github.com/kyazdani42/nvim-tree.lua
local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
  return
end

-- list operation shortcuts
local list_keys = require('user.keybindings').nvimTreeList

nvim_tree.setup({
  -- fully disable builtin netrw
  disable_netrw = true,
  -- disable git status icon
  git = {
    enable = false,
  },
  -- project plugin
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    -- hide dot files
    dotfiles = true,
    -- hide node_modules folders
    -- custom = { "node_modules" },
  },
  view = {
    width = 34,
    side = 'left',
    hide_root_folder = false,
    -- custom list shortcuts
    mappings = {
      -- use builtin shortcuts only
      custom_only = true,
      list = list_keys,
    },
    -- disable line number
    number = false,
    relativenumber = false,
    -- enable column sign icon
    signcolumn = 'yes',
  },
  actions = {
    open_file = {
      -- resize window while opening
      resize_window = true,
      -- quit nvim tree while opening
      quit_on_open = false,
    },
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- mac
    cmd = 'open',
    -- windows
    -- cmd = "wsl-open",
  },
})
