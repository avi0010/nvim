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
  use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "folke/which-key.nvim"
  use "danymat/neogen"
  use "rcarriga/nvim-notify"
  use "tpope/vim-surround"
  use "unblevable/quick-scope"
  use "mhinz/vim-grepper"
  use "norcalli/nvim-colorizer.lua"
  use "gelguy/wilder.nvim"
  use "xiyaowong/nvim-transparent"
  use 'karb94/neoscroll.nvim'
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }
  use{"p00f/nvim-ts-rainbow"}
  use {'nvim-orgmode/orgmode'}
  -- use{"lukas-reineke/indent-blankline.nvim"}
  -- Colorschemes
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
  use "rebelot/kanagawa.nvim"
  use 'Yazeed1s/minimal.nvim'
  use 'B4mbus/oxocarbon-lua.nvim'
  use "sam4llis/nvim-tundra"

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

  use "williamboman/nvim-lsp-installer"
  use "neovim/nvim-lspconfig"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

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
  -- NOTE: RUST working with rust-tools
  use {"simrat39/rust-tools.nvim"}
  use {
      'saecki/crates.nvim',
      tag = 'v0.2.1',
      event = { "BufRead Cargo.toml" },
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
          require('crates').setup()
      end,
  }

  -- Project --
  use { 'nvim-telescope/telescope-project.nvim' }

  -- DAP-mode --
  use { 'mfussenegger/nvim-dap' }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'mfussenegger/nvim-dap-python' } -- Python
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'rcarriga/nvim-dap-ui'}
  -- Git
  use "lewis6991/gitsigns.nvim"
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use {"tpope/vim-fugitive"}
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
