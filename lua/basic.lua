-- text encoding utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

-- highlight cursor line
vim.wo.cursorline = true

-- ident: 2 <Space> equal 1 <Tab>
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true

-- new line auto intent current line
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- ignore search case expect upper case
vim.o.ignorecase = true
vim.o.smartcase = true

-- do not highlt search
-- vim.o.hlsearch = false

-- increase search while inputing
vim.o.incsearch = true

-- command line height
vim.o.cmdheight = 1

-- auto reload outter changed file
vim.o.autoread = true
vim.bo.autoread = true

-- do not wrap line
vim.wo.wrap = false

-- keep up/down n lines while scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- right reference line, 
-- exceeding on code is too long
-- consider wrapping to new line
-- vim.wo.colorcolumn = "80"

-- use number and relative number
vim.wo.number = true
vim.wo.relativenumber = true

-- mourse support
-- vim.o.mouse = "a

-- do not create backup
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.swapfile = false

-- split window below or right
vim.o.splitbelow = true
vim.o.splitright = true

-- enchance auto completion
vim.o.wildmenu = true

-- do not show invisible char
vim.o.list = false

-- show invisible char to list char
-- vim.o.listchars = "space:·,tab:··"

-- rust config
vim.g.rust_clip_command = 'pbcopy'