return {
    -- Mason for LSP server management
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'phpactor', 'pyright', 'terraformls', 'tflint' }
            })
        end
    },
    
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local cmp = require('cmp')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, {
                    { name = 'buffer' },
                })
            })

            cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
                sources = {
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" }
                }
            })

            -- LSP Configuration using vim.lsp.config (new syntax)
            local on_attach = function(client, bufnr)
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
            end

            -- Configure LSP servers using the new vim.lsp.config syntax
            vim.lsp.config.lua_ls = {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }

            vim.lsp.config.phpactor = {
                capabilities = capabilities,
                on_attach = on_attach,
                init_options = {
                    ["language_server_phpstan.enabled"] = true,
                    ["language_server_psalm.enabled"] = true,
                    ["phpunit.enabled"] = true,
                }
            }

            vim.lsp.config.arduino_language_server = {
                capabilities = capabilities,
                cmd = {
                    "arduino-language-server",
                    "--cli-config", "/home/agustin/.arduino15/arduino-cli.yaml",
                    "--fqbn", "esp32:esp32:esp32"
                },
                on_attach = on_attach,
            }

            vim.lsp.config.terraformls = {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            
            vim.lsp.config.tflint = {
                capabilities = capabilities,
                on_attach = on_attach,
            }

            vim.lsp.config.pyright = {
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = { "pyright-langserver", "--stdio" },
                filetypes = { "python" },
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            }

            -- Terraform file type configuration
            vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
            vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
            vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
            vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
            vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
            vim.cmd([[let g:terraform_fmt_on_save=1]])
            vim.cmd([[let g:terraform_align=1]])
        end
    }
}
