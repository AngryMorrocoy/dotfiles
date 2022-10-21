-- Everything inherits snippets from javascript
require("luasnip").filetype_extend("javascriptreact", { "javascript" })
-- Hierarchy
require("luasnip").filetype_extend("typescript", { "javascript" })
require("luasnip").filetype_extend("typescriptreact", { "javascript", "javascriptreact" })

local manual_snips = {}
local auto_snips = {}

return manual_snips, auto_snips
