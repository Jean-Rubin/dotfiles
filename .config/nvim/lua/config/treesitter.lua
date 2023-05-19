require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        disable = function(lang, bufnr)
            return (
                lang == "latex"
                or lang == "markdown"
                or vim.api.nvim_buf_line_count(bufnr) > 5000)
        end
    },
    indent = {
        enable = true,
        disable = {"python", "cpp"}
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = ';',
            scope_incremental = "grc",
            node_decremental = ',',
        }
    },
    textobjects = {
        enable = true,
        disable = {"lua"},
        select = {
            enable = true,
            disable = {"lua"},
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aC"] = "@conditional.outer",
                ["iC"] = "@conditional.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["al"] = '@loop.outer',
                ["il"] = "@loop.inner",
                ["is"] = "@statement.inner",
                ["as"] = "@statement.outer",
                ["ad"] = "@comment.outer",
                ["am"] = "@call.outer",
                ["im"] = "@call.inner"
            }
        },
        swap = {
            enable = true,
            disable = {"lua"},
            swap_next = {
                ["gl"] = "@parameter.inner",
            },
            swap_previous = {
                ["gh"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            disable = {"lua"},
            goto_next_start = {
                [";f"] = "@function.outer",
                [";c"] = "@class.outer",
            },
            goto_next_end = {
                [";F"] = "@function.outer",
                [";C"] = "@class.outer",
            },
            goto_previous_start = {
                [",f"] = "@function.outer",
                [",c"] = "@class.outer",
            },
            goto_previous_end = {
                [",F"] = "@function.outer",
                [",C"] = "@class.outer",
            }
        },
        lsp_interop = {
            enable = true,
            disable = {"lua"},
            border = "rounded",
            peek_definition_code = {
                ["<leader><leader>f"] = "@function.outer",
                ["<leader><leader>c"] = "@class.outer"
            }
        }
    },
    -- refactor = {
    --     highlight_definitions = {
    --         enable = true
    --     },
    --     highlight_current_scope = {
    --         enable = false
    --     },
    --     smart_rename = {
    --         enable = true,
    --         keymaps = {
    --             smart_rename = "grr"
    --         }
    --     },
    --     navigation = {
    --         enable = true,
    --         keymaps = {
    --             goto_definition = "gnd",
    --             list_definitions = "gnD"
    --         }
    --     }
    -- },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<CR>',
            show_help = '?',
        },
    },
    rainbow = {
        enable = true,
        disable = { 'cpp' },
        extended_mode = true,
        max_file_lines = nil
    },
    ensure_installed = {"javascript", "lua", "python", "julia"}
}

vim.api.nvim_set_keymap('n', '<F1>', "<cmd>TSCaptureUnderCursor<CR>", { noremap = true })
