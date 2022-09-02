-- https://github.com/nvim-treesitter/nvim-treesitter
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  vim.notify('Not found installed nvim-treesitter!')
  return
end

treesitter.setup({
  -- install language parser
  -- :TSInstallInfo view supported languages
  ensure_installed = {
    'c',
    'cpp',
    'go',
    'lua',
    'rust',
    'json',
    'toml',
    'yaml',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'vim',
  },
  -- enable code highlight module
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- enable incremental selection module
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    },
  },
  -- enable code indent module
  indent = {
    enable = true,
  },
  -- p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      '#95ca60',
      '#ee6985',
      '#D6A760',
      '#7794f4',
      '#b38bf5',
      '#7cc7fe',
    }, -- table of hex strings
    -- termcolors = { } -- table of colour name strings
  },
})
-- enable folding module
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- defaults to no fold
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
