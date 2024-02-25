local config = require('rails-rspec-toggle.config')
local actions = require('rails-rspec-toggle.actions')

local M = {}

M.setup = config.setup
M.toggle = actions.toggle

return M
