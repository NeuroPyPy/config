
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>son", ':source $MYVIMRC<CR>')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<cr>")
vim.keymap.set("i", "kj", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', {noremap = true})
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', {noremap = true})
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', {noremap = true})
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', {noremap = true})

vim.keymap.set('n', '<Left>', '<C-W><', {noremap = true})
vim.keymap.set('n', '<Right>', '<C-W>>', {noremap = true})
vim.keymap.set('n', '<Up>', ':resize -2<CR>', {noremap = true})
vim.keymap.set('n', '<Down>', ':resize +2<CR>', {noremap = true})
vim.keymap.set('n', '<C-=>', '<C-W>=', {noremap = true})

vim.keymap.set('n', '<leader>|', ':vsplit<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>_', ':split<CR>', {noremap = true, silent = true})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- QUICK ROUTING TO DIRS -------
vim.keymap.set("n", "<leader>Gon", "<cmd>e ~/.config/nvim/<CR>"); -- go nvim
vim.keymap.set("n", "<leader>GoNm", "<cmd>e ~/.config/nvim/lua/flynnvim/maps.lua<CR>"); -- go nvim
vim.keymap.set("n", "<leader>GoNr", "<cmd>e ~/.config/nvim/lua/flynnvim/remap.lua<CR>"); -- go nvim
vim.keymap.set("n", "<leader>GoNl", "<cmd>e ~/.config/nvim/lua/flynnvim/<CR>"); -- go nvim
vim.keymap.set("n", "<leader>GoNp", "<cmd>e ~/.config/nvim/after/plugin/<CR>"); -- go nvim

vim.keymap.set("n", "<leader>Gor", "<cmd>e ~/repos/<CR>"); -- go repos
vim.keymap.set("n", "<leader>GoRf", "<cmd>e ~/repos/fluke<CR>"); -- go repos
vim.keymap.set("n", "<leader>GoRd", "<cmd>e ~/repos/.dotfiles<CR>"); -- go repos
vim.keymap.set("n", "<leader>Got", "<cmd>e ~/config/tmux/<CR>"); -- go tmux config

