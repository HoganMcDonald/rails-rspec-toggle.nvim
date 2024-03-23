local Files = {}

---Returns true if file exists
---
---@param path string
---@return boolean
Files.exists = function(path)
  return vim.fn.filereadable(path) == 1
end

---Returns the current file path
---
---@return string
Files.current_path = function()
  return vim.api.nvim_buf_get_name(0)
end

---Returns the path of the Rails root directory (location of the Gemfile)
---
---@return string
Files.root_path = function()
  local path = vim.fn.findfile('Gemfile', vim.fn.fnamemodify(Files.current_path(), ':p') .. ';')
  if path and #path > 0 then
    path = vim.fn.fnamemodify(path, ':p:h')
  end
  return path
end

---Opens file at path if it exists
---
---@param path string
Files.open = function(path)
  if Files.exists(path) then
    vim.cmd('e ' .. path)
  end
end

return Files
