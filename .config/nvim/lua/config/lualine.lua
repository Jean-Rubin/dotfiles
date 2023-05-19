local M = {}

function M.setup(colors)
    local custom_theme = {
      normal = {
        a = {bg = colors.base06, fg = colors.base00, gui = "bold"},
        b = {bg = colors.base03, fg = colors.base06},
        c = {bg = colors.base01, fg = colors.base07}
      },
      insert = {
        a = {bg = colors.base0D, fg = colors.base00, gui = "bold"},
        b = {bg = colors.base03, fg = colors.base06},
        c = {bg = colors.base01, fg = colors.base06}
      },
      visual = {
        a = {bg = colors.base0A, fg = colors.base00, gui = "bold"},
        b = {bg = colors.base03, fg = colors.base06},
        c = {bg = colors.base01, fg = colors.base06}
      },
      replace = {
        a = {bg = colors.base08, fg = colors.base00, gui = "bold"},
        b = {bg = colors.base03, fg = colors.base06},
        c = {bg = colors.base01, fg = colors.base06}
      },
      command = {
        a = {bg = colors.base0B, fg = colors.base00, gui = "bold"},
        b = {bg = colors.base03, fg = colors.base06},
        c = {bg = colors.base01, fg = colors.base06}
      },
      inactive = {
        a = {bg = colors.base00, fg = colors.base03, gui = "bold"},
        b = {bg = colors.base00, fg = colors.base03},
        c = {bg = colors.base00, fg = colors.base03}
      }
    }

    local config = {
        options = {
            icons_enabled = true,
            theme = custom_theme,
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch"},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {"progress"},
            lualine_z = {"location"}
        },
        tabline = {},
        winbar = {
            lualine_a = {},
            lualine_b = {
            },
            lualine_c = {
            },
            lualine_x = {
                {"diff"},
                {"diagnostics", sources={"nvim_lsp"}}
            },
            lualine_y = {"filename"},
            lualine_z = {}
        },
        inactive_winbar = {
            lualine_a = {},
            lualine_b = {
            },
            lualine_c = {
            },
            lualine_x = {
                {"diff"},
                {"diagnostics", sources={"nvim_lsp"}}
            },
            lualine_y = {"filename"},
            lualine_z = {}
        },
        extensions = {}
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
    end

    --Midsection
    ins_left {
        function()
            return '%='
        end,
    }

    --LSP Server name
    ins_left {
        function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end,
        icon = ' LSP:',
        color = { fg = '#2f9fdf', gui = 'bold' },
    }

    require('lualine').setup(config)
end

return M
