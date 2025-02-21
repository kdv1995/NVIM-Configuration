local M = {}
function M.config()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "ts_ls" }, -- ensure_installed = "all", -- one of "all" or a list of languages
		ignore_install = { "" }, -- List of parsers to ignore installing
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "vim", "vimdoc", "query" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = false,
		},
		autopairs = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		indent = { enable = true, disable = { "python", "css" } },

		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
	})
end

return M
