local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt

local snippets, autosnippets = {}, {}

table.insert(snippets, s("#!", {
    t("#!/usr/bin/env Rscript")
}))

table.insert(snippets, s("#'", fmt(
    [[
    #' {}
    #'
    #' {}
    #'
    #' @param {} {}
    #' @param {} {}
    #'
    #' @return {}
    #' @export
    #' @examples
    ]],
    {
        i(1, "Title"),
        i(2, "Description."),
        i(3, "parameter"),
        i(4, "Parameter description."),
        i(5, "parameter"),
        i(6, "Parameter description."),
        i(7, "Return description."),
    }
)))

table.insert(snippets, s("setwd", fmt(
    [[
    setwd("{}")
    ]],
    {
    f(function()
        return vim.fn.getcwd()
    end)
    }
)))

table.insert(snippets, s("png", fmt(
    [[
    png("{}.png", width = {}, height = {})
    ]],
    {
        i(1, "img"),
        i(2, "1920"),
        i(3, "1080")
    }
)))

table.insert(snippets, s("for", fmt(
    [[
    for ({} in {}) {{
      {}
    }}
    ]],
    {
        i(1, "i"),
        c(2, {
            fmt("seq_len({})", { i(1, "n") }),
            fmt("seq_along({})", { i(1, "vec") })
        }),
        i(3, "# TODO")
    }
)))

return snippets, autosnippets
