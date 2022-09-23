local M = {}

M.insertLeave = function() end
M.insertEnter = function() end

local sysname = vim.loop.os_uname().sysname

if sysname == 'Linux' then
  return M
end

defaultIMs = {
  'com.apple.keylayout.US',
  'com.apple.keylayout.ABC',
}

local status, defaultIM = pcall(vim.fn.system, { 'im-select' })
if not status then
  vim.notify('Not found im-select in the system')
  return M
end

M.defaultIM = defaultIM
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

if sysname == 'Darwin' then
  M.insertLeave = function()
    M.currentIM = vim.fn.system({ 'im-select' })
    vim.cmd(':silent :!im-select' .. ' ' .. M.defaultIM)
  end
  
  M.insertEnter = function()
    if M.currentIM then
      vim.cmd(':silent :!im-select' .. ' ' .. M.currentIM)
    else
      vim.cmd(':silent :!im-select' .. ' ' .. M.defaultIM)
    end
  end  
end

if sysname == 'Windows' then
  M.insertLeave = function()
    vim.cmd(':silent :!~/.config/nvim/im-select.exe 1033')
  end

  M.insertEnter = function()
    vim.cmd(':silent :!~/.config/nvim/im-select.exe 2052')
  end
end

return M
