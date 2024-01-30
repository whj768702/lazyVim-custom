--- 配置telescope过滤结果展示形式

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

-- 展示文件路径
local function filenameFullPath(_, path)
  local dirs = {}

  -- 使用模式匹配分割兼容不同平台
  for dir in string.gmatch(path, "[\\/]+([^\\/]+)") do
    table.insert(dirs, 1, dir)
  end

  local tail = vim.fs.basename(path)
  local parent1 = dirs[#dirs - 1]
  local parent2 = dirs[#dirs - 2]
  local parent3 = dirs[#dirs - 3]

  if parent3 then
    return string.format("%s\t\t%s\\%s\\%s", tail, parent1, parent2, parent3)
  elseif parent2 then
    return string.format("%s\t\t%s\\%s", tail, parent1, parent2)
  elseif parent1 then
    return string.format("%s\t\t%s", tail, parent1)
  else
    return tail
  end
end

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

return {
  require("telescope").setup({
    pickers = {
      -- 文件搜索展示结果
      find_files = {
        path_display = filenameFirst,
      },
      -- grep搜索展示结果
      live_grep = {
        path_display = filenameFirst,
      },
      -- buffers搜索展示结果
      buffers = {
        -- path_display = filenameFirst,
        path_display = filenameFullPath,
      },
    },
  }),
}
