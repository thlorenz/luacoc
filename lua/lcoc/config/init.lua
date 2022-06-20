local M = {}

--- Initialize lcoc default configuration and variables
function M:init()
  lcoc = vim.deepcopy(require "lcoc.config.defaults")
  local settings = require "lcoc.config.settings"
  settings.load_defaults()

  -- require("lcoc.keymappings").load_defaults()


  -- local autocmds = require "lcoc.core.autocmds"
  -- autocmds.load_defaults()
end

return M
