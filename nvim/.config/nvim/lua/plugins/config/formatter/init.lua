local M = {}
local prettier_config = require("plugins.config.formatter.prettier")
local luafmt_config = require("plugins.config.formatter.luafmt")
local black_config = require("plugins.config.formatter.black")

M.filetype_formatters = {
    javascript = prettier_config,
    javascriptreact = prettier_config,
    typescriptreact = prettier_config,
    typescript = prettier_config,
    json = {
        function()
            return prettier_config[1](2)
        end
    },
    html = {
        function()
            return prettier_config[1](4)
        end
    },
    htmldjango = {
        function()
            return prettier_config[1](4)
        end
    },
    css = prettier_config,
    scss = prettier_config,
    lua = luafmt_config,
    python = black_config
}

function M.setup()
    vim.g["formatter#autoformat"] = true
    require("formatter").setup(
        {
            logging = false,
            filetype = M.filetype_formatters
        }
    )
end

return M
