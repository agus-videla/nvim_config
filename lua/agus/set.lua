vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false
vim.o.cmdheight = 0
vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    callback = function(ev)
        if ev.event == "CmdlineEnter" then
            vim.o.cmdheight = 1
        else
            vim.o.cmdheight = 0
        end
    end,
})

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.winborder = "rounded"
vim.o.cursorline = true -- Highlight line under cursor

vim.o.smarttab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.wrap = false

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vim.o.undofile = true

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

vim.o.scrolloff = 8

vim.o.updatetime = 50
vim.o.colorcolumn = "80"

vim.o.signcolumn = "yes"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    desc = "Highlight yank",
})
