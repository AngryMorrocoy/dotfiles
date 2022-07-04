return {
    function()
        return {
            exe = "gofmt",
            args = {
                "-w",
                vim.api.nvim_buf_get_name(0)
            },
            stdin = false
        }
    end
}
