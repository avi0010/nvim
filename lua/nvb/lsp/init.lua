local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("nvb.lsp.lsp-installer")

require("nvb.lsp.handlers").setup()
require "nvb.lsp.config"
require "nvb.lsp.null-ls"

vim.notify("LSP loaded")
