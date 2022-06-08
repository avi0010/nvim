require "nvb.dap.python"
vim.g.dap_virtual_text = true
local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
  return
end

dapui.setup()
