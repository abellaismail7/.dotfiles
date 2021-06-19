local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local empty = {}
-- navigation
map("n", "<C-h>", 		[[<C-w>h]],		empty)
map("n", "<C-j>", 		[[<C-w>j]],		empty)
map("n", "<C-k>", 		[[<C-w>k]],		empty)
map("n", "<C-l>", 		[[<C-w>l]],		empty)

-- resize windows
map("n", "<C-M-h>", 	[[<C-w><]], 	empty)
map("n", "<C-M-j>", 	[[<C-w>+]], 	empty)
map("n", "<C-M-k>", 	[[<C-w>-]], 	empty)
map("n", "<C-M-l>", 	[[<C-w>>]], 	empty)

-- registers

map("v", "<leader>p", 	[["_dP]],		{noremap = true})

map("n", "<leader>y", 	[["+y]], 		{noremap = true})
map("v", "<leader>y", 	[["+y]], 		{noremap = true})
map("n", "<leader>Y", 	[["+Y]], 		{noremap = true})


map("n", "<leader>d", 	[["_d]], 		{noremap = true})
map("v", "<leader>d", 	[["_d]], 		{noremap = true})
map("n", "<leader>i", 	[[p<C-a>Y]], 	{noremap = true})


map("n", "<leader>1", 	[[1gt]],		{noremap = true})
map("n", "<leader>2", 	[[2gt]],		{noremap = true})
map("n", "<leader>3", 	[[3gt]],		{noremap = true})
map("n", "<leader>4", 	[[4gt]],		{noremap = true})
map("n", "<leader>5", 	[[5gt]],		{noremap = true})
map("n", "<leader>6", 	[[6gt]],		{noremap = true})
map("n", "<leader>7", 	[[7gt]],		{noremap = true})
map("n", "<leader>8", 	[[8gt]],		{noremap = true})
map("n", "<leader>9", 	[[9gt]],		{noremap = true})
map("n", "<leader>0", 	[[:tablast<cr>]], {noremap = true})




map("i", "<expr> <Tab>  ",  [[pumvisible() ? "\<C-n>" : "\<Tab>"]],		{noremap = true})
map("i", "<expr> <S-Tab>",  [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],	{noremap = true})

-- telescope

map("n", "<C-p> 	",  	[[:lua require('telescope.builtin').git_files()<CR>]], {noremap = true})
map("n", "<Leader>ff",  	[[:lua require('telescope.builtin').find_files()<CR>]], {noremap = true})
map("n", "<leader>fs",  	[[:lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]], {noremap = true})
map("n", "<leader>fw",  	[[:lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]], {noremap = true})
map("n", "<leader>fb",  	[[:lua require('telescope.builtin').buffers()<CR>]], {noremap = true})
map("n", "<leader>vh",  	[[:lua require('telescope.builtin').help_tags()<CR>]], {noremap = true})




