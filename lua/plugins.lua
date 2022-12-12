local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    print("Installing packer.nvim...")
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    print("Installation finished!")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup({function(use)
  use "wbthomason/packer.nvim"

  -- Add/change/delete surrounding delimiter pairs with ease
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = "require('setup.nvim-surround')"
  }

  -- A super powerful autopair plugin that supports multiple characters
  use {
    "windwp/nvim-autopairs",
    config = "require('setup.nvim-autopairs')"
  }

  -- Smart and powerful comment plugin
  use {
    "numToStr/Comment.nvim",
    config = "require('setup.comment')"
  }

  -- Displays a popup with possible keybindings of the command you started typing
  use {
    "folke/which-key.nvim",
    config = "require('setup.which-key')"
  }

  -- A legend for your keymaps, commands, and autocmds
  use {
    "mrjones2014/legendary.nvim",
    requires = {"stevearc/dressing.nvim"},
    -- config = "require('setup.legendary')"
  }

  -- Ties related commands into a family of short bindings with a common prefix
  use {
    "anuvyklack/hydra.nvim",
    config = "require('setup.hydra')"
  }

  -- A file explorer tree
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = "require('setup.nvim-tree')"
  }

  -- No-nonsense floating terminal plugin
  use {
    "numToStr/FTerm.nvim",
    config = "require('setup.fterm')"
  }

  -- A highly extendable fuzzy finder over lists
  use {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
      {"nvim-telescope/telescope-file-browser.nvim"},
      {"xiyaowong/telescope-emoji.nvim"},
      {"ghassan0/telescope-glyph.nvim"},
      {"nvim-tree/nvim-web-devicons"},
    },
    config = "require('setup.telescope')"
  }

  -- A highly customizable theme with support for lsp, treesitter and a variety of plugins
  use {
    "EdenEast/nightfox.nvim",
    config = "require('setup.themes.nightfox')"
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end,
config = {
  display = {
    open_fn = require("packer.util").float
  }
}})
