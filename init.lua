if not vim.fn.has('nvim-0.8') then
  vim.notify('Need neovim v0.8+ to run this config!')
  return
end

local ok, _ = pcall(require, 'impatient')
if not ok then
  vim.notify('Not found installed impatient.nvim plugin!', vim.log.levels.WARN)
end

local ok, err = pcall(require, 'user')
if not ok then
  vim.notify(('Error loading core...\n\n%s'):format(err))
  return
end
