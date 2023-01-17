local builtin = require('telescope.builtin');
local option = vim.opt;
local keymap = vim.keymap;

--Basic Editor Setup
option.nu = true;
option.tabstop = 4;
option.softtabstop = 4;
option.shiftwidth = 4;
option.expandtab = true;
option.smartindent = true;
option.wrap = false;
option.swapfile = false;
option.hlsearch = false;
option.incsearch = true;
option.updatetime = 50;

--Keybinds
vim.g.mapleader = (" ")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set('n', '<leader>f', builtin.find_files, {})

--Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "rust", "c", "lua", "vim", "help" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    }
}

-- Setup Editor Theme
function theme(color)
    color = color or "zephyr"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end
theme()