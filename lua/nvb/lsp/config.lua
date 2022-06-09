local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("ERROR while loading nvim-lsp-config")
	return
end
local servers = {
  "jsonls",
  "rust_analyzer",
  "sumneko_lua",
  "pyright"
}

for _, server in pairs(servers) do
  local serverOpts = {
    on_attach = require("nvb.lsp.handlers").on_attach,-- on_attach is defined outside this snippet
    capabilities = require("nvb.lsp.handlers").capabilities,
  }

  if server == "rust_analyzer" then
    local ok_rt, rust_tools = pcall(require, "rust-tools") 
    if not ok_rt then
      print("Failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.")
    else
      local rust_opts = require("nvb.lsp.settings.rust_analyzer")
      local opts = vim.tbl_deep_extend("force", serverOpts, rust_opts)
      rust_tools.setup({
        server = opts,
        tools = {
          autoSetHints = true,
          hover_with_actions = false,
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
          },
        },
      })
      require('rust-tools.inlay_hints').set_inlay_hints()
      goto continue
    end
  end

  if server == "pyright" then
    local pyright_opts = require("nvb.lsp.settings.pyright")
    local opts = vim.tbl_deep_extend("force", serverOpts, pyright_opts)
    lspconfig.pyright.setup(opts)
  end

  ::continue::
end
