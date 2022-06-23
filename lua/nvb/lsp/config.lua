local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("ERROR while loading nvim-lsp-config")
	return
end
local servers = {
  "sumneko_lua",
  "pyright"
}

for _, server in pairs(servers) do
  local serverOpts = {
    on_attach = require("nvb.lsp.handlers").on_attach,-- on_attach is defined outside this snippet
    capabilities = require("nvb.lsp.handlers").capabilities,
  }

  if server == "pyright" then
    local pyright_opts = require("nvb.lsp.settings.pyright")
    local opts = vim.tbl_deep_extend("force", serverOpts, pyright_opts)
    lspconfig[server].setup(opts)
  end

  if server == "sumneko_lua" then
    lspconfig[server].setup(serverOpts)
  end
end

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        on_attach = require("nvb.lsp.handlers").on_attach,
        capabilities = require("nvb.lsp.handlers").capabilities,
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
            }
        }
    },
}

require('rust-tools').setup(opts)
