local g = vim.g
local M = {}

function M.setup()
    g.vim_json_syntax_conceal = 0
    g.vim_markdown_conceal = 0
    g.vim_markdown_conceal_code_blocks = 0
end


return M
