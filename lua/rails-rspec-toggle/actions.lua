local getFilePath = function()
  if vim.bo.filetype == 'ruby' then
    return vim.api.nvim_buf_get_name(0)
  end
end

local M = {}

---Returns true if the spec file was opened
---
---@param filePath string
---@param rootPath string
---@return boolean
M.open_spec_from_app = function(filePath, rootPath)
  local regexPattern = "^" .. rootPath .. "/app/(.*)%.rb$"
  local match = string.match(filePath, regexPattern)
  if match then
    print('this is an app file')
    return true
  end
  return false
end

---Returns true if the app file was opened
---
---@param filePath string
---@param rootPath string
---@return boolean
M.open_app_from_spec = function(filePath, rootPath)
  -- TODO: replace spec with a configuration
  local regexPattern = "^" .. rootPath .. "/" .. "test" .. "/(.*)_test%.rb$"
  local match = string.match(filePath, regexPattern)
  if match then
    return true
  end
  return false
end

M.toggle = function()
  local filePath = getFilePath()
  local rootPath = vim.loop.cwd()
  if (filePath and rootPath) then
    local didOpenSpec = M.open_spec_from_app(filePath, rootPath)
    if not didOpenSpec then
      M.open_app_from_spec(filePath, rootPath)
    end
  end
end

return M
