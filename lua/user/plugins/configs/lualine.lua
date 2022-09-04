-- https://github.com/nvim-lualine/lualine.nvim
local status, lualine = pcall(require, 'lualine')
if not status then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    disabled_filetypes = { 'NvimTree', 'TelescopePrompt', 'packer', 'toggleterm', 'dashboard' },
    always_divide_middle = true,
    globalstatus = true,
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
