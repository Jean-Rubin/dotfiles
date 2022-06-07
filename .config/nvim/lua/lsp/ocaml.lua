local lsp_common_setup = require('lsp.lsp_setup')
local lsp_config = require('lspconfig')
lsp_config.ocamllsp.setup{
    capabilities = lsp_common_setup.capabilities,
    handlers = lsp_common_setup.handlers,
    on_attach = lsp_common_setup.on_attach,
    root_dir = lsp_config.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "*.ml")
}
