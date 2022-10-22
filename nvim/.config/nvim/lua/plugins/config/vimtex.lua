local M = {}

local function get_build_path()
    local cur_file = vim.fn.expand("%:t:r")
    return string.format("tex-build_%s", cur_file)
end

function M.setup()
    vim.g.tex_conceal = "abdmg"
    vim.g.vimtex_compiler_latexmk = {
        ["build_dir"] = get_build_path,
    }
end

return M
