local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print("ERROR while loading nvim-lsp-installer")
	return
end
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("ERROR while loading nvim-lsp-config")
	return
end
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  require("nvim-lsp-installer").setup {}

	local opts = {
		on_attach = require("nvb.lsp.handlers").on_attach,
		capabilities = require("nvb.lsp.handlers").capabilities,
	}

	 if server.name == "pyright" then
	 	local jsonls_opts = require("nvb.lsp.settings.pyright")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    lspconfig.pyright.setup(opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("nvb.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    lspconfig.sumneko_lua.setup(opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
end)
