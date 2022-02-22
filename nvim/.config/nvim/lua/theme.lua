local g = vim.g

local function colorscheme(colo)
    vim.cmd("colorscheme " .. colo)
end

-- vim.cmd("set background=light")

g.tokyonight_style = "storm"

g.gruvbox_material_visual = "blue background"

g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_enable_bold = 1
g.gruvbox_material_palette = "original"
g.gruvbox_material_background = "medium"
g.gruvbox_material_menu_selection_background = "aqua"
g.gruvbox_material_ui_contrast = "high"
g.gruvbox_material_diagnostic_virtual_text = "colored"

-- g.gruvbox_material_transparent_background = 1

-- g.rose_pine_variant = "moon"
g.material_style = "deep ocean"
-- g.material_style = "darker"
-- g.material_style = "oceanic"

-- g.material_style = "darker"

-- g.moonflyTransparent = 1

return {
    lua_theme = "material",
    load_theme = function()
        -- colorscheme "moonfly"
        -- colorscheme "melange"
        -- colorscheme "omni"
        -- colorscheme "rvcs"
        -- colorscheme "gruvbox-material"
        -- colorscheme "aurora"
        -- colorscheme "tokyonight"
        -- colorscheme "pinkmare"
        -- colorscheme "ayu-dark"
        -- colorscheme "flattened_dark"
        -- colorscheme "rose-pine"
        -- colorscheme "nightfly"
        colorscheme "material"
    end
}
