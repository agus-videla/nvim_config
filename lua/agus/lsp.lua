vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- See :help vim.lsp.*
        local opts = { buffer = ev.buf, silent = true }

        opts.desc  = "Show LSP references"
        vim.keymap.set("n", "<leader>r", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "<leader>i", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP Type Definitions"
        vim.keymap.set("n", "<leader>t", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definition"
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Show LSP definition"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "LSP Rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show Buffer Diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics", opts)

        opts.desc = "Show Line Diagnostics"
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

        opts.desc = "Format File"
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)

        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[e", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)

        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "[e", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)

        opts.desc = "Show hover documentation"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end
})
