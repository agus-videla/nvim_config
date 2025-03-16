local builtin = require('telescope.builtin')
local action = require('telescope.actions')
local setup = require('telescope').setup
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pr', builtin.resume, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- files staged in git
vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

setup {
    defaults = {
        mappings = {
            n = {
                ['<C-d>'] = action.delete_buffer
            }
        }
    }
}
