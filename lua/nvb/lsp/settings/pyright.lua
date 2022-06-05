vim.notify("LSP loaded")
return {
  single_file_support = true,
	settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
      },
      pythonPath = "/usr/bin/python3.9",
    }
	},
}
