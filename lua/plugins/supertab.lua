-- Tab选择下一个
-- Shift-Tab选择上一个
return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    signature = { enabled = true },
    keymap = {
      preset = "default",
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Esc>"] = { "hide", "fallback" },
      ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = { list = { selection = {
      preselect = true,
      auto_insert = true,
    } } },
  },
}
-- return {
--   "saghen/blink.cmp",
--   opts = {
--     keymap = {
--       preset = "default",
--       ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
--       ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
--     },
--   },
-- }
-- return {
--   {
--     "L3MON4D3/LuaSnip",
--     keys = function()
--       return {}
--     end,
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       local has_words_before = function()
--         unpack = unpack or table.unpack
--         local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--         return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--       end
--
--       local cmp = require("cmp")
--
--       opts.mapping = vim.tbl_extend("force", opts.mapping, {
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
--             cmp.select_next_item()
--           elseif vim.snippet.active({ direction = 1 }) then
--             vim.schedule(function()
--               vim.snippet.jump(1)
--             end)
--           elseif has_words_before() then
--             cmp.complete()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif vim.snippet.active({ direction = -1 }) then
--             vim.schedule(function()
--               vim.snippet.jump(-1)
--             end)
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--       })
--     end,
--   },
-- }
