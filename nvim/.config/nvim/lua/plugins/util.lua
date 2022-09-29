local compe = {}

local function feedKeys(keys)
    local termcodes = vim.api.nvim_replace_termcodes(keys, true, true, true)
    vim.fn.feedkeys(termcodes)
end

function compe.complete_up()
    if vim.fn.pumvisible() ~= 0 then
        return feedKeys("<C-p>")
    end
end

function compe.complete_down()
    if vim.fn.pumvisible() ~= 0 then
        return feedKeys("<C-n>")
    end
end

return {
    compe = compe,
}
