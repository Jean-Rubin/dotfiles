require("nvim-autopairs").setup {
    fast_wrap = {}
}

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"ocaml"},
    callback = function()
        require("nvim-autopairs").remove_rule("'")
    end
})
