--
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
end

local nvim_tree = require("nvim-tree")

-- OR setup with some options
nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		adaptive_size = true,
		side = "left",
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		add_trailing = true,
		full_name = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
			},
			glyphs = {
				default = "󰈚",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	on_attach = my_on_attach,
})
