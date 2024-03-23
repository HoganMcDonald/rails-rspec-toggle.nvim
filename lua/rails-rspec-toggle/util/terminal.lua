local Files = require 'rails-rspec-toggle.util.files'

local Terminal = {}

local term = nil

---Runs command in a split terminal. When command completes, terminal split
---closes and callback is executed.
---
---@param command string
---@param callback function
Terminal.run = function(command, callback)
  local opts = {
    cwd = Files.root_path(),
    on_exit = function()
      if term and vim.fn.bufexists(term) > 0 then
        vim.api.nvim_buf_delete(term, { force = true })
      end
      callback()
    end,
  }
  vim.cmd 'botright 24split new'
  term = vim.api.nvim_get_current_buf()
  vim.fn.termopen(command, opts)
end

return Terminal
