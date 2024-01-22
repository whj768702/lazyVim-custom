-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.shell = "pwsh.exe"

-- 禁止修改自动同步到系统剪贴板
vim.opt.clipboard = ""
