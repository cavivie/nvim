-- https://github.com/rcarriga/nvim-notify
-- notifaction enhance
local status, notify = pcall(require, 'notify')
if not status then
  return
end

notify.setup({
  stages = 'slide',
  background_colour = 'FloatShadow',
  timeout = 3000,
})
vim.notify = require('notify')
