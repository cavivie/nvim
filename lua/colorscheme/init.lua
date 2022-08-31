local colorscheme = 'carbonfox'
require('colorscheme.configs.' .. colorscheme)

local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not ok then
  vim.notify('Not found colorscheme: ' .. colorscheme .. '!')
  return
end
