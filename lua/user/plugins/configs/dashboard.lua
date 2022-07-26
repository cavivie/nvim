-- https://github.com/glepnir/dashboard-nvim
local home = os.getenv('HOME')
local status, db = pcall(require, 'dashboard')
if not status then
  return
end

if vim.fn.has('mac') then
  -- macos
  db.preview_command = 'cat | lolcat -f 0.3'
else
  -- linux
  db.preview_command = 'ueberzug'
end

db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 11
db.preview_file_width = 40
db.custom_center = {
  {
    icon = '  ',
    desc = 'Recently latest session                 ',
    action = 'SessionLoad',
    shortcut = 'SPC s l',
  },
  {
    icon = '  ',
    desc = 'Recently opened files                   ',
    action = 'DashboardFindHistory',
    shortcut = 'SPC f h',
  },
  {
    icon = '  ',
    desc = 'Find File                               ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f',
  },
  {
    icon = '  ',
    desc = 'File Browser                            ',
    action = 'Telescope file_browser',
    shortcut = 'SPC f b',
  },
  {
    icon = '  ',
    desc = 'Find word                               ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w',
  },
  {
    icon = '  ',
    desc = 'Open Personal dotfiles                  ',
    action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
    shortcut = 'SPC f d',
  },
}
