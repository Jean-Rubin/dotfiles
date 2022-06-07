local lsp_common_setup = require('lsp.lsp_setup')

require('lspconfig').r_language_server.setup{
    capabilities = lsp_common_setup.capabilities,
    handlers = lsp_common_setup.handlers,
    on_attach = lsp_common_setup.on_attach,
    settings = {
        r = {
            lsp = {
                diagnostics = true,
                rich_documentation = false
            }
        }
    }
}
