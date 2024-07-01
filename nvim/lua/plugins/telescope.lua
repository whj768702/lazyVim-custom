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
local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)

  if parent == "." then
    return tail
  end

  local dirArr = {}

  for dir in parent:gmatch("[\\/]+([^\\/]+)") do
    dirArr[#dirArr + 1] = dir
  end

  if #dirArr == 0 then
    return tail
  elseif #dirArr == 1 then
    return string.format("%s\t\t%s", tail, dirArr[1])
  elseif #dirArr == 2 then
    return string.format("%s\t\t%s/%s", tail, dirArr[1], dirArr[2])
  elseif #dirArr >= 3 then
    return string.format("%s\t\t%s/%s/%s", tail, dirArr[#dirArr - 2], dirArr[#dirArr - 1], dirArr[#dirArr])
  end
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
      -- grep_string搜索展示结果
      grep_string = {
        path_display = filenameFirst,
      },
      -- git搜索展示结果
      git_files = {
        path_display = filenameFirst,
      },
      -- buffers搜索展示结果
      buffers = {
        path_display = filenameFirst,
      },
    },
  }),
}
