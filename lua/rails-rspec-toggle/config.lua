local M = {}

---@class Options
---@field spec_directory string
---@field spec_file_suffix string
---@field generator_map table

---@type Options
local defaults = {
  spec_directory = 'spec',
  spec_file_suffix = '_spec.rb',
  generator_map = {
    channel = 'rspec:channel',
    controller = 'rspec:controller',
    feature = 'rspec:feature',
    helper = 'rspec:helper',
    integration = 'rspec:integration',
    job = 'rspec:job',
    mailbox = 'rspec:mailbox',
    mailer = 'rspec:mailer',
    model = 'rspec:model',
    request = 'rspec:request',
    view = 'rspec:view',
  },
}

---@type Options
M.options = defaults

M.setup = function(opts)
  M.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
end

return M
