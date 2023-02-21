local builtin = require('telescope.builtin');
local option = vim.opt;
local keymap = vim.keymap;
vim.g.vimtex_view_method = 'zathura'

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
option.laststatus = 0;
option.signcolumn = "number";
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
keymap.set("n", "<leader>q", [[!prettier --stdin-filepath %]])

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
    vim.cmd.highlight({ "GitGutterAdd", "ctermbg=none" })
    vim.cmd.highlight({ "GitGutterDelete", "ctermbg=none" })
    vim.cmd.highlight({ "GitGutterChange", "ctermbg=none" })
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
    end

Theme()
