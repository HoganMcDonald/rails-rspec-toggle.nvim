local options = require('rails-rspec-toggle.config').options
local Files = require('rails-rspec-toggle.util.files')
local Rails = require('rails-rspec-toggle.util.rails')
local Terminal = require('rails-rspec-toggle.util.terminal')

local M = {}

---For a given app file path, open the spec file. Create/generate it if not
---found
---
---@param file_path string
---@param root_path string
M.open_spec_from_app = function(file_path, root_path)
  local regex_pattern = "^" .. root_path .. "/app/(.*)%.rb$"
  local match = string.match(file_path, regex_pattern)
  if match then
    local spec_file_path = Files.root_path() .. Rails.spec_file_path(match)
    if not Files.exists(spec_file_path) then
      local generator_command = Rails.generate(match)
      if generator_command then
        Terminal.run(generator_command, function()
          Files.open(spec_file_path)
        end)
      else
        Files.open(spec_file_path)
      end
    else
      Files.open(spec_file_path)
    end
  end
end

---For a given spec file path, open the app file. Create empty file if not
---found
---
---@param filePath string
---@param rootPath string
M.open_app_from_spec = function(filePath, rootPath)
  local regexPattern = "^" .. rootPath .. "/" .. options.spec_directory .. "/(.*)" .. "_spec.rb$"
  local match = string.match(filePath, regexPattern)
  if match then
    local app_file_path = Files.root_path() .. Rails.app_file_path(match)
    Files.open(app_file_path)
  end
end

---Entry point for plugin
---
---If current file is not a ruby file, do nothing
---
---If current file is an app file, try to open the spec file. Run rspec
---generator if not found
---
---If current file is a spec file, try to open the app file. Create empty file
---if not found
M.toggle = function()
  if not vim.bo.filetype == 'ruby' then
    return
  end
  local file_path = Files.current_path()
  local root_path = Files.root_path()
  if root_path and file_path then
    local file_type = Rails.file_type(file_path)
    if file_type == 'app' then
      M.open_spec_from_app(file_path, root_path)
    elseif file_type == 'spec' then
      M.open_app_from_spec(file_path, root_path)
    end
  end
end

return M
