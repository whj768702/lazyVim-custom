-- if vim.g.vscode then
-- else
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.o.shell = "pwsh.exe"
-- 禁止修改自动同步到系统剪贴板
vim.opt.clipboard = ""
-- end

if vim.g.vscode then
  -- undo/REDO via vscode
  vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
  vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")
end
