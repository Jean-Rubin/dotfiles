local wk = require("which-key")

require("gitsigns").setup {
    signs = {
        delete = { hl = "GitSignsDelete", text = '▁', numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn", show_count = true },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ';h', function()
            if vim.wo.diff then return ';h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr = true})

        map('n', ',h', function()
            if vim.wo.diff then return ',h' end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, {expr = true})

        map({'n', 'v'}, "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
        map({'n', 'v'}, "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
        map('n', "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
        map('n', "<leader>hu", gs.undo_stage_hunk, { desc = "Unstage Hunk" })
        map('n', "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
        map('n', "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
        map('n', "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame Line" })
        map('n', "<leader>htb", gs.toggle_current_line_blame, { desc = "Toggle Current Blame line" })
        map('n', "<leader>hd", gs.diffthis, { desc = "Diff This" })
        map('n', "<leader>hD", function() gs.diffthis('~') end, { desc = "Diff This Global" })
        map('n', "<leader>htd", gs.toggle_deleted, { desc = "Toggle Deleted" })
        map({'o', 'x'}, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Hunk object" })
    end
}

wk.register {
    ["<leader>h"] = {
        name = "hunk",
        t = { name = "toggle" }
    }
}
