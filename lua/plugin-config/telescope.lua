local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("Not found installed telescope!")
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- enter init mode while opening window, defaults to insert mode, also can be normal mode
    initial_mode = "insert",
    -- vertical , center , cursor
    layout_strategy = "horizontal",
    -- shortcuts in window
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- optional args： dropdown, cursor, ivy
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        -- even more opts
      }),
    },
  },
})

pcall(telescope.load_extension, "env")
-- to get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, "ui-select")
