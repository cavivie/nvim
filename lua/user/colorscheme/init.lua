local colorscheme = 'carbonfox'

local status, _ = pcall(require, 'user.colorscheme.configs.' .. colorscheme)
if not status then
  return
end

local status, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status then
  return
end
