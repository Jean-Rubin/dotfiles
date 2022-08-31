local ls = require('luasnip')
local s = ls.s
local t = ls.t
local i = ls.i
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local function math()
    return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function nonmath()
    return not math()
end

local snippets, autosnippets = {}, {}

table.insert(snippets, s("sec", fmt(
    [[
    \section{{{}}}
    ]],
    {
        i(1, "")
    }
)))

table.insert(snippets, s("ssec", fmt(
    [[
    \subsection{{{}}}
    ]],
    {
        i(1, "")
    }
)))

table.insert(snippets, s("sssec", fmt(
    [[
    \subsubsection{{{}}}
    ]],
    {
        i(1, "")
    }
)))

table.insert(snippets, s("bg", fmt(
    [[
    \begin{{{}}}
        {}
    \end{{{}}}
    ]],
    {
        i(1, "align*"),
        i(2, ""),
        rep(1)
    }
)))

table.insert(snippets, s("mbb", fmt(
    [[
    \mathbb{{{}}}
    ]],
    {
        i(1, "R")
    }
), { condition = math }))

table.insert(snippets, s("mbf", fmt(
    [[
    \mathbf{{{}}}
    ]],
    {
        i(1, "")
    }
), { condition = math }))

table.insert(snippets, s("mcal", fmt(
    [[
    \mathcal{{{}}}
    ]],
    {
        i(1, "")
    }
), { condition = math }))

table.insert(snippets, s("mfrak", fmt(
    [[
    \mathfrak{{{}}}
    ]],
    {
        i(1, "S")
    }
), { condition = math }))

table.insert(snippets, s("mrm", fmt(
    [[
    \mathrm{{{}}}
    ]],
    {
        i(1, "")
    }
), { condition = math }))

table.insert(snippets, s("txbf", fmt(
    [[
    \textbf{{{}}}
    ]],
    {
        i(1, "")
    }
)))


table.insert(snippets, s("txit", fmt(
    [[
    \textit{{{}}}
    ]],
    {
        i(1, "")
    }
)))

table.insert(snippets, s("txsc", fmt(
    [[
    \textsc{{{}}}
    ]],
    {
        i(1, "")
    }
)))

table.insert(snippets, s("dm", fmt(
    [[
    \[
        {}
    \]
    ]],
    {
        i(1, "")
    }
), { condition = nonmath }))

table.insert(snippets, s("**", fmt(
    [[
    ^{{{}}}
    ]],
    {
        i(1, "")
    }
), { condition = math }))

table.insert(snippets, s("__", fmt(
    [[
    _{{{}}}
    ]],
    {
        i(1, "")
    }
), { condition = math }))

table.insert(snippets, s("//", fmt(
    [[
    \frac{{{}}}{{{}}}
    ]],
    {
        i(1, ""),
        i(2, "")
    }
), { condition = math }))

table.insert(snippets, s("sum", fmt(
    [[
    \sum_{{{} = {}}}{}
    ]],
    {
        i(1, "i"),
        i(2, "1"),
        c(3, {
            fmt("^{{{}}}", { i(1, "n") }),
            t("")
        })
    }
), { condition = math }))

table.insert(snippets, s("tbl", fmt(
   [[
   \begin{{table}}[h]
       \centering
       \caption{{{}}}
       \label{{tab - {}}}
       $
       \begin{{array}}{{{}}}
           \hline
           {}
           \hline
           {}
           \hline
       \end{{array}}
       $
   \end{{table}}
   ]],
   {
       i(1, ""),
       c(2, {
           rep(1),
           i(1, "")
       }),
       i(3, "|c|cc|"),
       i(4, ""),
       i(5, "")
   }
)))


table.insert(snippets, s("fig", fmt(
   [[
   \begin{{figure}}[h]
       \centering
       \includegraphics[width=\linewidth]{{{}}}
       \caption{{{}}}
       \label{{fig - {}}}
   \end{{figure}}
   ]],
   {
       i(1, ""),
       i(2, ""),
       c(3, {
           rep(1),
           i(1, "")
       })
   }
)))

return snippets, autosnippets
