-- detect command line arguments
for i, v in ipairs(vim.v.argv) do
  if v == '--headless' then
    _G.headless = true
  end
  if v == 'PackerSync' then
    _G.PackerSync = true
  end
end

-- reload user configurations
function _G.ReloadConfig(notify)
  local luacache = (_G.__luacache or {}).cache
  for name, _ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
      if luacache then
        luacache[name] = nil
      end
    end
  end
  vim.o.modifiable = true
  dofile(vim.env.MYVIMRC)
  if notify then
    vim.notify('Nvim configuration reloaded!', vim.log.levels.INFO)
  end
end
