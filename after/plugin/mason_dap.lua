require("mason").setup()
require("mason-nvim-dap").setup({
    ensure_installed = {'php'},
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end
    }
})

local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/home/Agustin/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        pathMappings = {
            ["/home/sb-3/www/iats/code"] = "/home/sb-3/www/iats/code",
        }
    }
}
