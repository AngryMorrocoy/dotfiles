local M = {}

function M.setup()
    require("lint").linters_by_ft = {
        python = {"flake8", "mypy"},
        javascript = {"eslint"},
        typescript = {"eslint"},
        javascriptreact = {"eslint"},
        typescriptreact = {"eslint"}
    }
end

return M
