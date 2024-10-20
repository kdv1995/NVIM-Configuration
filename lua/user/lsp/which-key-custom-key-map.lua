-- Set the leader key (example: Space as leader)
vim.g.mapleader = " "

local mappings = {
	-- Alpha start screen
	vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Alpha" }),

	-- Telescope Buffers with dropdown, no preview
	vim.keymap.set(
		"n",
		"<leader>b",
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		{ desc = "Buffers" }
	),

	-- NvimTree file explorer toggle
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" }),

	-- Save the current buffer
	vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" }),

	-- Quit Neovim without saving
	vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" }),

	-- Remove search highlighting
	vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" }),

	-- Find files with Telescope dropdown, no preview
	vim.keymap.set(
		"n",
		"<leader>f",
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		{ desc = "Find Files" }
	),

	-- Find text with Telescope live grep in Ivy theme
	vim.keymap.set("n", "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Find Text" }),

	-- Open Telescope Projects extension
	vim.keymap.set(
		"n",
		"<leader>P",
		"<cmd>lua require('telescope').extensions.projects.projects()<cr>",
		{ desc = "Projects" }
	),

	-- Packer commands
	vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" }),
	vim.keymap.set("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" }),
	vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" }),
	vim.keymap.set("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Packer Status" }),
	vim.keymap.set("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" }),

	-- Git commands with Gitsigns and Telescope
	vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Lazygit" }),
	vim.keymap.set("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = "Next Hunk" }),
	vim.keymap.set("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = "Prev Hunk" }),
	vim.keymap.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" }),
	vim.keymap.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" }),
	vim.keymap.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" }),
	vim.keymap.set("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" }),
	vim.keymap.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" }),
	vim.keymap.set(
		"n",
		"<leader>gu",
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		{ desc = "Undo Stage Hunk" }
	),
	vim.keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", { desc = "Open Changed File" }),
	vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout Branch" }),
	vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Checkout Commit" }),
	vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", { desc = "Diff" }),

	-- LSP commands
	vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" }),
	vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document Diagnostics" }),
	vim.keymap.set("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace Diagnostics" }),
	vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" }),
	vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer Info" }),
	vim.keymap.set("n", "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" }),
	vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" }),
	vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" }),
	vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quickfix" }),
	vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" }),
	vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" }),
	vim.keymap.set(
		"n",
		"<leader>lS",
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		{ desc = "Workspace Symbols" }
	),
	vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "Format Document" }),

	-- Search commands using Telescope
	vim.keymap.set("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout Branch" }),
	vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" }),
	vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" }),
	vim.keymap.set("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" }),
	vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" }),
	vim.keymap.set("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" }),
	vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" }),
	vim.keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" }),

	-- Terminal commands
	vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", { desc = "Node" }),
	vim.keymap.set("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", { desc = "NCDU" }),
	vim.keymap.set("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", { desc = "Htop" }),
	vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", { desc = "Python" }),
	vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" }),
	vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal" }),
	vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" }),

	-- OpenAI (ChatGPT integration) commands
	vim.keymap.set("n", "<leader>oi", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "Edit with instructions" }),
	vim.keymap.set("n", "<leader>og", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" }),
	vim.keymap.set("n", "<leader>oa", "<cmd>ChatGPTActAs<cr>", { desc = "ChatGPT Prompts" }),
	vim.keymap.set("n", "<leader>oc", "<cmd>ChatGPTCompleteCode<cr>", { desc = "Code Completion" }),
	vim.keymap.set("n", "<leader>ot", "<cmd>ChatGPT translate<cr>", { desc = "Translate with ChatGPT" }),
	vim.keymap.set("n", "<leader>ok", "<cmd>ChatGPT keywords<cr>", { desc = "Keywords with ChatGPT" }),
	vim.keymap.set("n", "<leader>od", "<cmd>ChatGPT docstring<cr>", { desc = "Docstring with ChatGPT" }),
	vim.keymap.set("n", "<leader>ou", "<cmd>ChatGPT add_tests<cr>", { desc = "Add tests with ChatGPT" }),
	vim.keymap.set("n", "<leader>oo", "<cmd>ChatGPT optimize_code<cr>", { desc = "Optimize code with ChatGPT" }),
	vim.keymap.set("n", "<leader>os", "<cmd>ChatGPT summarize<cr>", { desc = "Summarize with ChatGPT" }),
	vim.keymap.set("n", "<leader>of", "<cmd>ChatGPT fix_bugs<cr>", { desc = "Fix bugs with ChatGPT" }),
	vim.keymap.set("n", "<leader>oe", "<cmd>ChatGPT explain_code<cr>", { desc = "Explain code with ChatGPT" }),

	-- Delete the current buffer
	vim.keymap.set("n", "<leader>d", ":bd! | q!<CR>", { silent = true }),

	-- Delete the current buffer and ignore changes
	vim.keymap.set("n", "<leader>di", ":bd!<CR>", { silent = true }),

	-- Delete a buffer by its name or number
	vim.keymap.set("n", "<leader>bdn", ":BufDel ", { silent = true }),

	-- Delete all listed buffers
	vim.keymap.set("n", "<leader>da", ":%bd|e#|bd#<CR>", { silent = true }),

	-- Delete all listed buffers except the current one
	vim.keymap.set("n", "<leader>de", ":BufDelOthers<CR>", { silent = true }),
}
