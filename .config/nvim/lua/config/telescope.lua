local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local wk = require("which-key")

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
        sorting_strategy = "ascending",
        theme = "dropdown",
        layout_config = {
            width = 0.9,
            height = 0.7,
            horizontal = {
                preview_width = 0.55,
            },
            prompt_position = "top",
        }
    },
}

vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set('n', "<leader>fl", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set('n', "<leader>fh", builtin.help_tags, { desc = "Find Help Docs" })
vim.keymap.set('n', "<leader>fq", builtin.quickfix, { desc = "Find Quickfix" })
vim.keymap.set('n', "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Document Symbols" })
vim.keymap.set('n', "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Find Workspace Symbols" })
vim.keymap.set('n', "<leader>fgd", builtin.git_commits, { desc = "Find Git Directory Commits" })
vim.keymap.set('n', "<leader>fgc", builtin.git_bcommits, { desc = "Find Git Buffer Commits" })
vim.keymap.set('n', "<leader>fgb", builtin.git_branches, { desc = "Find Git Branches" })
vim.keymap.set('n', "<leader>fgs", builtin.git_status, { desc = "Find Git Status" })

wk.register {
    ["<leader>f"] = {
        name = "find",
        ['g'] = { name = "git" }
    }
}
