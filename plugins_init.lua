-- ============================================================================
-- plugins/init.lua — Custom plugin definitions
-- These are loaded on top of NvChad's built-in plugins.
-- Run :Lazy sync after making changes here.
-- ============================================================================

return {

  -- --------------------------------------------------------------------------
  -- Formatting — conform.nvim
  -- Formatters run on demand. To enable format-on-save, uncomment
  -- the format_on_save block in configs/conform.lua
  -- --------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- --------------------------------------------------------------------------
  -- LSP — nvim-lspconfig
  -- Language servers configured in configs/lspconfig.lua
  -- Add more servers there: html, cssls, pyright, gopls, etc.
  -- --------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- --------------------------------------------------------------------------
  -- Harpoon 2 — pin frequently used files
  -- Keybindings: Space ha (pin), Space hh/hj/hk/hl (jump to 1-4)
  -- --------------------------------------------------------------------------
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end,
  },

  -- --------------------------------------------------------------------------
  -- Toggleterm — floating terminal overlay
  -- Keybinding: Space tt or C-\
  -- --------------------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        direction = "float",
        float_opts = { border = "curved" },
      }
    end,
  },

  -- --------------------------------------------------------------------------
  -- Telescope Frecency — smart recent files
  -- Ranks files by frequency + recency (frecency score)
  -- Keybinding: Space fr
  -- --------------------------------------------------------------------------
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
}
