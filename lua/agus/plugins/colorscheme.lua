return {
    "rebelot/kanagawa.nvim",
    build = function()
        vim.cmd("KanagawaCompile")
    end,
    config = function()
        require('kanagawa').setup({
            compile = true,
        })
        vim.cmd("colorscheme kanagawa-wave")
    end,
}
