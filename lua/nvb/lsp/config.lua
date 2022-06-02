local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "sumneko_lua", "pyright"}

lsp_installer.setup {
	ensure_installed = servers
}

--[[ for _, server in pairs(servers) do
	local opts = {
		on_attach = require("nvb.lsp.handlers").on_attach,
		capabilities = require("nvb.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "nvb.lsp.settings." .. server)
	if has_custom_opts then
	 	opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end ]]
local opts = {
  on_attach = require("nvb.lsp.handlers").on_attach,
  capabilities = require("nvb.lsp.handlers").capabilities,
}
local has_custom_opts, server_custom_opts = pcall(require, "nvb.lsp.settings.pyright")
if has_custom_opts then
  opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
end
lspconfig.pyright.setup{opts}
