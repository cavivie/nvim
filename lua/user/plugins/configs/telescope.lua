-- https://github.com/nvim-telescope/telescope.nvim
local status, telescope = pcall(require, 'telescope')
if not status then
  return
end

-- local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    -- enter init mode while opening window, defaults to insert mode, also can be normal mode
    initial_mode = 'insert',
    -- vertical , center , cursor
    layout_strategy = 'horizontal',
    -- shortcuts in window
    mappings = require('user.keybindings').telescopeList,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown", -- optional args： dropdown, cursor, ivy
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown({
        -- even more opts
      }),
    },
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

pcall(telescope.load_extension, 'env')

-- to get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
pcall(telescope.load_extension, 'ui-select')

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
pcall(telescope.load_extension, 'file_browser')

-- search notication histories
pcall(telescope.load_extension, 'notify')
