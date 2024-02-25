local M = {}

---@class Options
---@field spec_directory string
---@field spec_file_suffix string

---@type Options
local defaults = {
  spec_directory = "test",
  spec_file_suffix = "_test.rb"
}

---@type Options
M.options = defaults

M.setup = function(opts)
  M.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

return M
