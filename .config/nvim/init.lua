require "pluginList"
require "treesitter-nvim"
require "statusline"

require "nvim-lspconfig"

vim.cmd('let mapleader = " "')

vim.api.nvim_set_option("hidden",true)
-- vim.api.nvim_set_option("noshowmode",true)
vim.api.nvim_set_option("hidden",true)
vim.api.nvim_set_option("backspace","indent,eol,start")
vim.api.nvim_set_option("arabicshape",true)

vim.wo.number = true
vim.wo.numberwidth = 2
vim.wo.cul = true

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.timeoutlen = 5000
vim.o.wildmode = "longest,list,full"
vim.o.wildmenu = true
vim.o.termguicolors = true

vim.api.nvim_set_option("autoindent",true)
vim.api.nvim_set_option("expandtab",true)
vim.api.nvim_set_option("encoding","UTF-8")
vim.api.nvim_set_option("completeopt","menuone,noinsert,noselect")

-- blankline

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false


require "mappings"
vim.cmd("colo onedark")
vim.cmd("syntax on")

require("bufferline").setup{
    options={
		numbers = "ordinal",
		offsets = {{filetype = "NvimTree", text = "", padding = 1}},
		indicator_icon = '',
        show_close_icon=false,
        show_buffer_close_icons=false,
		separator_style = "thick",
		view = "multiwindow",
		mappings = true,
		always_show_bufferline = true,
    },
}
vim.g.nvim_tree_indent_markers = 1


require "nvimtree"
require "highlights"
require "compe-completion"
require "telescope-nvim"
require "whichkey"

local opt = {silent = true}
local map = vim.api.nvim_set_keymap
-- MAPPINGS
map("n", "<leader>t", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<leader>x", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<leader>.", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<leader>,", [[<Cmd>BufferLineCyclePrev<CR>]], opt)



