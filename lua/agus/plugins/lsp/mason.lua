-- Server names available at https://github.com/neovim/nvim-lspconfig/tree/master/lsp
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
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
