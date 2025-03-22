-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>kl", ":silent !toggleLiveServer.sh<CR>", { noremap = true, silent = true })
local term = require("config.terminal")
local opts = { silent = true }
local keymap = vim.keymap.set
local function opt(desc, others)
  return vim.tbl_extend("force", opts, { desc = desc }, others or {})
end

keymap("t", "<C-q>", [[<C-\><C-n>]], opt("Escape in terminal window"))
keymap({ "n", "t" }, "<A-t>", function()
  term:new({ execn = "zsh", name = "Shell" }):toggle()
end, opt("Open Shell"))
keymap({ "n", "t" }, "<A-b>", function()
  term:new({ execn = "btop", name = "Btop" }):toggle()
end, opt("Open Btop"))
keymap("n", "<Leader>tT", "<Cmd>terminal<CR>", opt("Neoterminal"))
keymap({ "n", "t" }, "<A-d>", function()
  term:new({ name = "webpackBuild" }):run("npm run build")
end)
keymap({ "n", "t" }, "<A-s>", function()
  term:new({ name = "webpackLive" }):run("npm run dev")
end)
vim.keymap.set("n", "<leader>rh", require("config.lsp-refresh").refresh, { desc = "Refresh LSP" })
