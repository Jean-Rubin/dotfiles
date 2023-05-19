local M = {}
-- vim.cmd([[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
-- highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
-- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]])

function M.setup(colorscheme)
    require('colorscheme.template').setup(colorscheme)
    require('config.lualine').setup(colorscheme)
end

return M
