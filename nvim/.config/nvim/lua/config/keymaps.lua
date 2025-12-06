-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "U", "<C-r>") -- Redo: U
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>r", "*``cgn", { desc = "Search and replace word under cursor" })
vim.keymap.set(
	"x",
	"<leader>r",
	"y/\\V<C-R>=escape(@\",'/\\')<CR><CR>Ncgn",
	{ desc = "Search and replace visual selection" }
)

vim.keymap.set("n", "W", "$", { desc = "Jump to end of line" })
vim.keymap.set("n", "B", "_", { desc = "Jump to first non-blank character" })

-- Toggle terminal with § (works in normal and terminal mode)
-- Function is defined in snacks.lua
vim.keymap.set("n", "§", _G.toggle_terminal, { desc = "Toggle terminal" })
vim.keymap.set("t", "§", "<C-\\><C-n><cmd>lua _G.toggle_terminal()<CR>", { desc = "Toggle terminal" })
