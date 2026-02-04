local keymap = vim.keymap
--[[local lspconfig = require("config.lspconfig")
vim.lsp.config(
    "*",
    {
        capabilities = require("blink-cmp").get_lsp_capabilities(lspconfig.default_capabilities),
        on_attach = lspconfig.on_attach,
        root_markers = { ".git" },
    }
)
]]
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- See :help vim.lsp.*
        local opts  = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "<leader>r", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "<leader>i", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP Type Definitions"
        keymap.set("n", "<leader>t", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definition"
        keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        opts.desc = "Show LSP definition"
        keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "LSP Rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show Buffer Diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics", opts)

        opts.desc = "Show Line Diagnostics"
        keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[e", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "[e", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)

        opts.desc = "Show hover documentation"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end
})
