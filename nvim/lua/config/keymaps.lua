-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

if vim.bo.filetype == "typst" then
  map("n", "<leader>p", "<cmd>lua vim.fn.jobstart(\"zathura ./main.pdf\")<cr>", { desc = "View PDF with Zathura" })
end

if vim.bo.filetype == "c" then
  map("n", "<leader>CC", "<cmd>lua vim.fn.jobstart(\"gcc main.c -o main\")<cr>", { desc = "Compile main C file" })
end

map("n", ";", ":")
map("n", "<leader>cc", "<cmd>bdelete<cr>", { desc = "Close current buffer" })

map({"n", "v", "i", "t"}, "<C-Tab>", "<cmd>bnext<cr>", { desc = "Move to next buffer" })
map({"n", "v", "i", "t"}, "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Move to previous buffer" })

map("n", "<leader>Cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Open chat panel" })

map("n", "<leader>\\", "<cmd>normal gcc<cr>", { desc = "Toggle Comment (gcc)" })
