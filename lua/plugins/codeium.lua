return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        bin_path = "C:/Users/wuhuijie/.codeium/bin",
      })
    end,
  },
}
