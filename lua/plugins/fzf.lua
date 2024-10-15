return {
  require("fzf-lua").setup({
    defaults = {
      formatter = { "path.filename_first", 2 },
    },
  }),
}
