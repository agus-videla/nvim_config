local map = vim.keymap.set

-- This is necessary for VimTeX to load properly. The "indent" is optional.
-- Note: Most plugin managers will do this automatically!
vim.cmd("filetype plugin indent on")

-- This enables Vim's and neovim's syntax-related features. Without this, some
-- VimTeX features will not work (see ":help vimtex-requirements" for more
-- info).
-- Note: Most plugin managers will do this automatically!
vim.cmd("syntax enable")

-- Viewer options: One may configure the viewer either by specifying a built-in
-- viewer method:
vim.cmd("let g:vimtex_view_method = 'zathura'")

map("n", "<localleader>cc", ":VimtexCompile<CR>")
map("n", "<localleader>co", ":VimtexCompileOutput<CR>")
