-- https://github.com/rcarriga/nvim-notify
-- notifaction enhance
require('notify').setup({
  stages = 'slide',
  background_colour = 'FloatShadow',
  timeout = 3000,
})
vim.notify = require('notify')