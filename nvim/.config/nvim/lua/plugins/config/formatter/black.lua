return {
    function()
        return {
            exe = "black",
            args = {"--stdin-filename", vim.api.nvim_buf_get_name(0), "-l", "79"},
            stdin = false
        }
    end
}
