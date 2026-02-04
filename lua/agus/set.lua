local set = vim.opt
local setg = vim.g

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME").."/.config/nvim/.undodir"
set.undofile = true

set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true

set.scrolloff = 8

set.updatetime = 50
set.colorcolumn = "80"

setg.netrw_banner=0
