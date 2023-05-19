local lsp_common_setup = require('lsp.lsp_setup')

require('lspconfig').tsserver.setup{
    capabilities = lsp_common_setup.capabilities,
    handlers = lsp_common_setup.handlers,
    on_attach = lsp_common_setup.on_attach
}

require('lspconfig').svelte.setup{
    capabilities = lsp_common_setup.capabilities,
    handlers = lsp_common_setup.handlers,
    on_attach = lsp_common_setup.on_attach
}

