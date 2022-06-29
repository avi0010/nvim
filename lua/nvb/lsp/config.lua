local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end
local servers = {
  "sumneko_lua",
  "pyright",
  "rust_analyzer",
  "taplo"
}
lsp_installer.setup()
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("nvb.lsp.handlers").on_attach, -- on_attach is defined outside this snippet
    capabilities = require("nvb.lsp.handlers").capabilities,
  }

  if server == "pyright" then
    local pyright_opts = require("nvb.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", opts, pyright_opts)
  end

if server == "rust_analyzer" then
    require("rust-tools").setup {
      tools = {
        on_initialized = function()
          vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
        end,
      },
      server = {
        on_attach = require("nvb.lsp.handlers").on_attach,
        capabilities = require("nvb.lsp.handlers").capabilities,
        settings = {
          ["rust-analyzer"] = {
            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }

    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
