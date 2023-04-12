local telescope = require('telescope.builtin');
local autotag = require('nvim-ts-autotag').setup();

require("dap-vscode-js").setup({
  debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
})

local js_based_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

for _, language in ipairs(js_based_languages) do
  require("dap").configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    }
  }
end
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

local option = vim.opt;
local keymap = vim.keymap;
local dap = require("dap")
vim.g.vimtex_view_method = 'zathura'

--Basic Editor Setup
option.nu = true;
option.tabstop = 2;
option.softtabstop = 2;
option.shiftwidth = 2;
option.expandtab = true;
option.smartindent = true;
option.wrap = false;
option.swapfile = false;
option.hlsearch = false;
option.incsearch = true;
option.updatetime = 50;
option.laststatus = 0;
option.signcolumn = "number";
option.autoindent = true;
option.clipboard = "unnamedplus";
option.termguicolors = true;
vim.g.gitgutter_set_sign_backgrounds = 1;
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- Gui options
vim.o.guifont = "Fira Code:h7"
vim.g.neovide_refresh_rate = 120

--Keybinds
vim.g.mapleader = (" ")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set('n', '<leader>f', telescope.find_files, {})
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>a", "ggVG")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set('n', '<F5>', require 'dap'.continue)
keymap.set('n', '<F10>', require 'dap'.step_over)
keymap.set('n', '<F11>', require 'dap'.step_into)
keymap.set('n', '<F12>', require 'dap'.step_out)
keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

keymap.set('n', '<leader>B', function()
  require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

keymap.set('n', '<leader>ui', require 'dapui'.toggle)

--Treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "rust", "c", "lua", "vim", "help" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  }
}

-- Setup Editor Theme
function Theme(color)
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)
  vim.cmd([[
    highlight GitGutterAdd ctermbg=none
    highlight GitGutterAdd guibg=none
    highlight Normal ctermbg=none
    highlight Normal guibg=none
    highlight signcolumn ctermbg=none
    highlight signcolumn guibg=none
  ]])
end

Theme()
