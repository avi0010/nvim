local status_ok, _ = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print("Unable to load nvim-lsp-installer init")
	return
end

-- require("nvb.lsp.lsp-installer")

require("nvb.lsp.handlers").setup()
require "nvb.lsp.null-ls"
require "nvb.lsp.config"

