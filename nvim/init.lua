-- vim interface setup
local tab_size = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false

-- vim indent
vim.opt.tabstop = tab_size
vim.opt.shiftwidth = tab_size

-- vim font setup
vim.opt.ambw = "double"

-- vim map toggle relativenumber
vim.keymap.set('n', 'eN', function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end)

local commenter = require("my_tools.commenter")

vim.keymap.set({'n', 'i'}, '<C-/>', commenter.toggle_signle_comment, {silent = true, noremap = true})
vim.keymap.set('v', '<C-/>', commenter.toggle_multiple_comment, {silent = true, noremap = true})
