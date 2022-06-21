local M = {}

local function config()
  local conf =  {
    breakpoint = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    breakpoint_rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },

    adapters = {
      rt_lldb = {
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
      }
    },

    configurations = {
      rust = {
        {
          name = 'Launch',
          type = 'rt_lldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
      }
    }
  }
  return conf
end

M.setup = function()
  local dap = require "dap"
  local conf = config()

  vim.fn.sign_define("DapBreakpoint", conf.breakpoint)
  vim.fn.sign_define("DapBreakpointRejected", conf.breakpoint_rejected)
  vim.fn.sign_define("DapStopped", conf.stopped)

  dap.configurations = conf.configurations
  dap.adapters = conf.adapters
  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
end

return M
