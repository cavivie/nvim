local M = {}

defaultIMs = {
  'com.apple.keylayout.US',
  'com.apple.keylayout.ABC',
}
M.defaultIM = vim.fn.system({ 'im-select' })
M.currentIM = M.defaultIM
for _, defaultIM in ipairs(defaultIMs) do
  vim.cmd(':silent :!im-select' .. ' ' .. defaultIM)
  local defaultIM = vim.fn.system({ 'im-select' })
  vim.cmd(':silent :!im-select' .. ' ' .. M.currentIM)
  if defaultIM then
    M.defaultIM = defaultIM
    break
  end
end

M.macInsertLeave = function()
  M.currentIM = vim.fn.system({ 'im-select' })
  vim.cmd(':silent :!im-select' .. ' ' .. M.defaultIM)
end

M.macInsertEnter = function()
  if M.currentIM then
    vim.cmd(':silent :!im-select' .. ' ' .. M.currentIM)
  else
    vim.cmd(':silent :!im-select' .. ' ' .. M.defaultIM)
  end
end

M.windowsInsertLeave = function()
  vim.cmd(':silent :!~/.config/nvim/im-select.exe 1033')
end

M.windowsInsertEnter = function()
  vim.cmd(':silent :!~/.config/nvim/im-select.exe 2052')
end

return M
