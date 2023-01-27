local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,
    ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { "⌘", "DiagnosticInfo" } }
            }
        }
    }
})

vim.keymap.set({"i", "s"}, "<M-n>", function()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end, { desc = "Luasnip Next Node" })


vim.keymap.set({"i", "s"}, "<M-N>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { desc = "Luasnip Previous Node" })

vim.keymap.set({"i", "s"}, "<M-j>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { desc = "Luasnip Next Choice" })

vim.keymap.set({"i", "s"}, "<M-k>", function()
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end, { desc = "Luasnip Previous choice" })

vim.keymap.set("n", "<leader>es", function()
    require("luasnip.loaders.from_lua").edit_snippet_files()
end, { desc = "Edit Lua Snippet" })

