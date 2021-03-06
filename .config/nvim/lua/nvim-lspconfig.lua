local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	buf_set_keymap("n", "<leader>ld", 	[[:lua vim.lsp.buf.declaration() 					<cr>]], opts)
	buf_set_keymap("n", "<leader>lD", 	[[:lua vim.lsp.buf.definition()						<cr>]], opts)
	buf_set_keymap("n", "<leader>li", 	[[:lua vim.lsp.buf.implementation()					<cr>]], opts)
	buf_set_keymap("n", "<leader>lh", 	[[:lua vim.lsp.buf.hover() 							<cr>]], opts)
	buf_set_keymap("n", "<leader>lrn", 	[[:lua vim.lsp.buf.rename() 						<cr>]], opts)
	buf_set_keymap("n", "<leader>lre", 	[[:lua vim.lsp.buf.references() 					<cr>]], opts)
	buf_set_keymap("n", "<leader>lf ",	[[:lua vim.lsp.buf.formatting() 					<cr>]], opts)
	buf_set_keymap("n", "<leader>la ",	[[:lua vim.lsp.buf.code_action() 					<cr>]], opts)
	buf_set_keymap("n", "<leader>le ",	[[:lua vim.lsp.diagnostic.show_line_diagnostics()	<cr>]], opts)
	
	buf_set_keymap("n", "<C-n>",	 	[[:lua vim.lsp.diagnostic.goto_next() 				<cr>]], opts)
	buf_set_keymap("n", "<C-p>",		[[:lua vim.lsp.diagnostic.goto_prev()				<cr>]], opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "clangd", "dartls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
