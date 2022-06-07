local lsp_common_setup = require('lsp.lsp_setup')
local lsp_config = require('lspconfig')

lsp_config.julials.setup{
   -- on_new_config = function(new_config, _)
   --   local server_path = "/home/jean/.julia/packages/LanguageServer/JrIef/src"
   --     local cmd = {
   --         "julia",
   --         "--project="..server_path,
   --         "--startup-file=no",
   --         "--history-file=no",
   --         "-e", [[
   --             using Pkg;
   --             Pkg.instantiate()
   --             using LanguageServer; using SymbolServer;
   --             depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
   --             project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
   --             # Make sure that we only load packages from this environment specifically.
   --             @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
   --             server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
   --             server.runlinter = true;
   --             run(server);
   --         ]]
   --     };
   --   new_config.cmd = cmd
   -- end,
   capabilities = lsp_common_setup.capabilities,
   handlers = lsp_common_setup.handlers,
   on_attach = lsp_common_setup.on_attach,
   root_dir = function(fname)
        return lsp_config.util.root_pattern 'Project.toml'(fname) or lsp_config.util.find_git_ancestor(fname) or lsp_config.util.root_pattern('*.jl')
    end,
}
