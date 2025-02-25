return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    prioity = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       -- floats = "light",
  --     },
  --   },
  -- },
}
