local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use 'kyazdani42/nvim-tree.lua'
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "folke/which-key.nvim"
  use "vimwiki/vimwiki"
  use "danymat/neogen"
  use "rcarriga/nvim-notify"
  use "tpope/vim-surround"
  use "unblevable/quick-scope" 
  -- Colorschemes
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
  use "lunarvim/darkplus.nvim"
  use "rebelot/kanagawa.nvim"
  use "sainnhe/everforest"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- TMUX --
  use "christoomey/vim-tmux-navigator"
  use "preservim/vimux"

    -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- StatusLine --
  use {
	  "SmiteshP/nvim-gps",
	  requires = "nvim-treesitter/nvim-treesitter"
  }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  -- RUST --
  use {
    "simrat39/rust-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
    module = "rust-tools",
    ft = { "rust" },
    config = function()
      require('rust-tools.inlay_hints').set_inlay_hints()
      require('rust-tools.inlay_hints').toggle_inlay_hints()
      require("rust-tools").setup{}
    end,
  }

  -- Project --
  use { 'nvim-telescope/telescope-project.nvim' }

  -- Git
  use "lewis6991/gitsigns.nvim"
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use {"tpope/vim-fugitive"}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
