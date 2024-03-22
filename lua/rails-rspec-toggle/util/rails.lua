local options = require('rails-rspec-toggle.config').options
local Files = require('rails-rspec-toggle.util.files')

local Rails = {}

---Returns "spec" or "app" based on the directory file_path is located in
---
---@param file_path string
---@return string|nil "spec" or "app"
Rails.file_type = function(file_path)
  if string.match(file_path, "^" .. Files.root_path() .. "/spec/") then
    return 'spec'
  elseif string.match(file_path, "^" .. Files.root_path() .. "/app/") then
    return 'app'
  end
end

---takes a partial path and returns the spec file path.
---
---@param partial_path string
---@return string
Rails.spec_file_path = function(partial_path)
  return '/' .. options.spec_directory .. '/' .. partial_path .. options.spec_file_suffix
end

---takes a partial path and returns the app file path.
---
---@param partial_path string
---@return string
Rails.app_file_path = function(partial_path)
  return '/app/' .. partial_path .. '.rb'
end

---takes a partial path and calls the correct generator based on spec directory.
---runs command in a terminal split.
---
---@param partial_path string
---@return string|nil
Rails.generate = function(partial_path)
  local spec_type = string.match(partial_path, "^(.*)s%/")
  local app_file = string.match(partial_path, "/(.*)$")
  local generator = options.generator_map[spec_type]
  if not generator then
    return nil
  end
  return 'bundle exec rails g ' .. generator .. ' ' .. app_file
end

return Rails
