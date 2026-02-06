-- Server names available at https://github.com/neovim/nvim-lspconfig/tree/master/lsp
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls@3.16.4", -- https://github.com/folke/lazydev.nvim/issues/136
        "phpactor",
        "pyright",
        "gopls",
      },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
