local module = {}

-- LSP setup
function module.setup()
	vim.lsp.config('clangd', 
	{
		cmd = { 'clangd' },
		filetypes = { 'c', 'cpp' }
	})
	vim.lsp.enable("clangd")
end

function module.docstring_and_diagnostic()	
	local diagnostic = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1})
	if #diagnostic > 0 then
		vim.diagnostic.open_float()
	else 
		vim.lsp.buf.hover()
	end
end

return module
