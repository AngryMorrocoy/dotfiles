return {
    function(tab_width)
        if tab_width == nil then
            tab_width = 2
        end

        return {
            exe = "prettier",
            args = {
                "--stdin-filepath",
                vim.api.nvim_buf_get_name(0),
                "--single-quote",
                string.format("--tab-width %s", tab_width)
            },
            stdin = true
        }
    end
}
