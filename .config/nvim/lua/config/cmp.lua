vim.opt.completeopt = "menuone,noselect"

local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup {
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer", keyword_length = 5, max_item_count = 5},
        { name = "latex_symbols", keyword_length = 2, max_item_count = 5 }
    }),
    formatting = {
        format = lspkind.cmp_format {
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
                nvim_lsp = "[LSP]",
                buffer = "[Buffer]",
                path = "[Path]",
                luasnip = "[Snip]",
                latex_symbols = "[λ]"
            }
        }
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true })
    }),
    -- experimental = {
    --     native_menu = false,
    --     ghost_text = true
    -- }
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    })
})
