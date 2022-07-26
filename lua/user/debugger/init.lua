local status, dap = pcall(require, 'dap')
if not status then
  return
end

local status, dapui = pcall(require, 'dapui')
if not status then
  return
end

local status, nvim_dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if not status then
  return
end

nvim_dap_virtual_text.setup({
  commented = true,
})

vim.fn.sign_define('DapBreakpoint', {
  text = '🛑',
  texthl = 'LspDiagnosticsSignError',
  linehl = '',
  numhl = '',
})

vim.fn.sign_define('DapStopped', {
  text = '',
  texthl = 'LspDiagnosticsSignInformation',
  linehl = 'DiagnosticUnderlineInfo',
  numhl = 'LspDiagnosticsSignInformation',
})

vim.fn.sign_define('DapBreakpointRejected', {
  text = '',
  texthl = 'LspDiagnosticsSignHint',
  linehl = '',
  numhl = '',
})

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { 'o', '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  layouts = {
    -- Layouts define sections of the screen to place windows.
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40, -- 40 columns
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 0.25, -- 25% of total lines
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'single', -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  },
}) -- use default

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end
