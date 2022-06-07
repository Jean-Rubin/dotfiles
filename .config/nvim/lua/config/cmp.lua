local utils = require('utils')

utils.opt('o', 'completeopt', 'menuone,noselect')

local lspkind = require('lspkind')
local cmp = require('cmp')

local cmp_snips = require("cmp_nvim_ultisnips.mappings")

cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'ultisnips', keyword_length = 5 },
        { name = 'latex_symbols', keyword_length = 2, max_item_count = 5 }
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                nvim_lsp = '[LSP]',
                buffer = '[Buffer]',
                path = '[Path]',
                ultisnips = '[Snip]',
                latex_symbols = '[λ]'
            }
        }
    },
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                cmp_snips.expand_or_jump_forwards(fallback)
            end,
            { 'i', 's' }
        ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                cmp_snips.jump_backwards(fallback)
            end,
            { 'i', 's' }
        )
    },
    experimental = {
        native_menu = false,
        ghost_text = true
    }
}
