require('nvim-autopairs').setup {
    fast_wrap = {}
}

vim.cmd [[au Filetype ocaml lua require('nvim-autopairs').remove_rule("'")]]
