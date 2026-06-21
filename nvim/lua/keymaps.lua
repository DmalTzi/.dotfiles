local module = {}

function module.setup()
	-- vim keymap toggle comment
	local commenter = require("my_tools.commenter")
	vim.keymap.set({'n', 'i'}, '<C-/>', commenter.toggle_signle_comment, {silent = true, noremap = true})
	vim.keymap.set('v', '<C-/>', commenter.toggle_multiple_comment, {silent = true, noremap = true})

	-- vim keymap toggle relativenumber
	vim.keymap.set('n', 'eN', function()
		vim.opt.relativenumber = not vim.opt.relativenumber:get()
	end)

	-- leader key map
	vim.keymap.set("n", "<leader>w", ":w<CR>")

	-- LSP keymap
	local module_lsp = require("lsp")
	module_lsp.setup()

	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "gr", vim.lsp.buf.references)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
	vim.keymap.set("n", "K", module_lsp.docstring_and_diagnostic)
end

return module
