local lsp_common_setup = require('lsp.lsp_setup')

local set_local_mappings = function(_, bufnr)
    vim.keymap.set(
        { "n" },
        "<leader>ah",
        "<Cmd>ClangdSwitchSourceHeader<CR>",
        { buffer = bufnr }
    )
end

require('lspconfig').clangd.setup {
    capabilities = lsp_common_setup.capabilities,
    handlers = lsp_common_setup.handlers,
    on_attach = function(client, bufnr)
        lsp_common_setup.on_attach(client, bufnr)
        set_local_mappings(client, bufnr)
    end
}
