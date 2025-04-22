return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    },
    lazy = false,
    config = function()
        local lsp = require('lsp-zero')
        local cmp = require('cmp')

        lsp.preset('recommended')

        lsp.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp.default_keymaps({buffer = bufnr})

          local opts = {buffer = bufnr, remap = false}

          vim.diagnostic.config({
            virtual_text = false
          })

          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
          vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
          vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
          vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
          vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
          vim.keymap.set("n", "<leader>qr", function() vim.lsp.buf.references() end, opts)
          vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
          vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)

        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        require('lspconfig').phpactor.setup {
            on_attach = on_attach,
            init_options = {
                ["language_server_phpstan.enabled"] = true,
                ["language_server_psalm.enabled"] = true,
                ["phpunit.enabled"] = true,
            }
        }

        require('lspconfig').arduino_language_server.setup {
          cmd = {
            "arduino-language-server",
            "--cli-config", "/home/Agustin/.arduino15/arduino-cli.yaml",
            "--fqbn", "esp32:esp32:esp32"
          },
          on_attach = on_attach,
        }


        require('lspconfig').terraformls.setup({})
        require('lspconfig').tflint.setup({})

        vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
        vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
        vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
        vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
        vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
        vim.cmd([[let g:terraform_fmt_on_save=1]])
        vim.cmd([[let g:terraform_align=1]])

        lsp.setup()

        cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" }
            }
        })
    end
}
