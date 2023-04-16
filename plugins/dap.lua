return {
  "mfussenegger/nvim-dap",
  enabled = vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        handlers = {
        }
      },
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
  },
  config = function()
    local dap = require('dap')
    local path = '/usr/bin/netcoredbg'
    dap.adapters.netcoredbg = {
      type = 'executable',
      command = path,
      args = { '--interpreter=vscode' },
    }
    local function get_dll()
      return coroutine.create(function(dap_run_co)
        local items = vim.fn.globpath(vim.fn.getcwd(), '**/bin/Debug/**/*.dll', 0, 1)
        local opts = {
          format_item = function(path)
            return vim.fn.fnamemodify(path, ':t')
          end,
        }
        local function cont(choice)
          if choice == nil then
            return nil
          else
            coroutine.resume(dap_run_co, choice)
          end
        end

        vim.ui.select(items, opts, cont)
      end)
    end
    dap.configurations.cs = {
      {
        type = "netcoredbg",
        request = "launch",
        name = "Launch file",
        program = get_dll,
      },
    }
  end,
  event = "User AstroFile",
}
