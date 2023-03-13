local builtin = require('telescope.builtin');
local autotag = require('nvim-ts-autotag').setup();
local option = vim.opt;
local keymap = vim.keymap;
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
vim.g.gitgutter_set_sign_backgrounds = 1;
vim.g.neovide_refresh_rate = 120


--Keybinds
vim.g.mapleader = (" ")
keymap.set("n", "<leader>e", vim.cmd.Ex)
keymap.set('n', '<leader>f', builtin.find_files, {})
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>a", "ggVG")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

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
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
    end

Theme()
