local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

-- local theme_ok, alpha_theme = pcall(require, "alpha.themes.startify")
-- if not theme_ok then
--  return
-- end

local dashboard = require "alpha.themes.dashboard"
local function header()
  return {
    [[        /\          /\          /\       ]],
    [[     /\//\\/\    /\//\\/\    /\//\\/\    ]],
    [[  /\//\\\///\\/\//\\\///\\/\//\\\///\\/\ ]],
    [[ //\\\//\/\\///\\\//\/\\///\\\//\/\\///\\]],
    [[ \\//\/                            \/\\//]],
    [[  \/                                  \/ ]],
    [[  /\                                  /\ ]],
    [[ //\\  Neovim IDE with LSP and DAP   //\\]],
    [[ \\//                                \\//]],
    [[  \/                                  \/ ]],
    [[  /\                                  /\ ]],
    [[ //\\/\                            /\//\\]],
    [[ \\///\\/\//\\\///\\/\//\\\///\\/\//\\\//]],
    [[  \/\\///\\\//\/\\///\\\//\/\\///\\\//\/ ]],
    [[      \/\\//\/    \/\\//\/    \/\\//\/   ]],
    [[         \/          \/          \/      ]],
  }
end
dashboard.section.header.val = header()
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}
local function footer()
  -- Number of plugins
  local total_plugins = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
  local datetime = os.date "%d-%m-%Y %H:%M:%S"
  local plugins_text = "   "
    .. total_plugins
    .. " plugins"
    .. "   v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
    .. "   "
    .. datetime

  -- Quote
  local fortune = require "alpha.fortune"
  local quote = table.concat(fortune(), "\n")

  return plugins_text .. "\n" .. quote
end
-- alpha.setup(alpha_theme.config)
dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Constant"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Function"
dashboard.section.buttons.opts.hl_shortcut = "Type"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
