local ls = require('luasnip')
local s = ls.s
local t = ls.t

local snippets, autosnippets = {}, {}

table.insert(snippets,
    s("p", { t("import pdb; pdb.set_trace()") })
)

return snippets, autosnippets
