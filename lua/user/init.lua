local modules = {
  -- load global envs
  'user.global',

  -- load basic config
  'user.basic',

  -- load color scheme
  'user.colorscheme',

  -- load key bindings
  'user.keybindings',

  -- load all plugins
  'user.plugins',

  -- load auto commands
  'user.autocmds',

  -- load language server
  'user.lsp',

  -- load debugging adapter
  'user.debugger',
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    error(('Error loading %s...\n\n%s'):format(mod, err))
  end
end
