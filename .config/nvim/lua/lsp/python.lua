local lsp_common_setup = require('lsp.lsp_setup')

require('lspconfig').pylsp.setup{
    capabilities = lsp_common_setup.capabilities,
    handlers = lsp_common_setup.handlers,
    on_attach = lsp_common_setup.on_attach,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle =  { enabled = false },
                pylint =  { enabled = false }
            }
        }
    }
}
