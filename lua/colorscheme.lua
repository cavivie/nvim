vim.o.background = "dark"
vim.g.tokyonight_style = "storm" -- day / night

-- 半透明
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
local colorscheme = "tokyonight"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("Not found colorscheme: " .. colorscheme .. "!")
  return
end
