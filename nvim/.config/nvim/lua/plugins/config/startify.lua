local g = vim.g
local M = {}

function M.setup()
    g.ascii = {
        "                ┌────────────────────────────┐            ",
        "                │                            │            ",
        "                │        m    m mmmmm        │            ",
        '                │        ##  ## #   "#       │            ',
        '                │        # ## # #mmmm"       │            ',
        '                │        # "" # #   "m       │            ',
        '                │        #    # #    "       │            ',
        "                │                            │            ",
        "                │                            │            ",
        "                └────────────────────────────┘            ",
        "----------------------------------------------------------",
        "__     _____ __  __ _ ____    ____ _____  _    ____ _____",
        "\\ \\   / /_ _|  \\/  ( ) ___|  / ___|_   _|/ \\  |  _ \\_   _|",
        " \\ \\ / / | || |\\/| |/\\___ \\  \\___ \\ | | / _ \\ | |_) || |",
        "  \\ V /  | || |  | |  ___) |  ___) || |/ ___ \\|  _ < | |",
        "   \\_/  |___|_|  |_| |____/  |____/ |_/_/   \\_\\_| \\_\\|_|"
    }
    g.startify_custom_header = "startify#pad(g:ascii)"

    g.startify_bookmarks = {
        {m = "/run/media/Shared/Shared/Music/canciones.txt"}
    }
    g.startify_files_number = 15
    g.startify_padding_left = 10

    g.startify_lists = {
        {["type"] = "bookmarks", header = {"        -Bookmarks-"}},
        {["type"] = "files", header = {"        -MRU-"}},
        {["type"] = "dir", header = {"        -MRU- " .. vim.fn.getcwd()}},
        {["type"] = "commands", header = {"        -Commands-"}}
    }
end

return M
