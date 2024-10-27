local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local telescope_builtin = require("telescope.builtin")

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NvimTree file explorer toggle
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })
-- Save the current buffer
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
-- Quit Neovim without saving
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
-- Remove search highlighting
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation: helps us to move between windows with Ctrl + h/j/k/l; e.g. when veritcal or horizontal splits;

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
-- keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)
-- keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
-- keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
-- keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- keymap("x", "j", ":m '>+1<cr>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope Buffers with dropdown, no preview
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fq", telescope_builtin.quickfix, { desc = "Telescope lsp document symbols" })
vim.keymap.set("n", "<leader>to", telescope_builtin.vim_options, { desc = "Telescope global variable options" })
vim.keymap.set("n", "<leader>tc", telescope_builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set("n", "<leader>tb", telescope_builtin.git_branches, { desc = "Telescope git branches" })
vim.keymap.set("n", "<leader>ts", telescope_builtin.git_status, { desc = "Telescope git status" })
vim.keymap.set("n", "<leader>tl", telescope_builtin.git_stash, { desc = "Telescope git stash" })
vim.keymap.set("n", "<leader>tm", telescope_builtin.man_pages, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>fc", telescope_builtin.commands, { desc = "Telescope list of commands" })

-- Packer commands
vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" })
vim.keymap.set("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" })
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" })
vim.keymap.set("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Peacker Status" })
vim.keymap.set("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- Git commands with Gitsigns and Telescope
vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Lazygit" })
-- vim.keymap.set("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", { desc = "Next Hunk" })
-- vim.keymap.set("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", { desc = "Prev Hunk" })
-- vim.keymap.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
-- vim.keymap.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", { desc = "Preview Hunk" })
-- vim.keymap.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", { desc = "Reset Hunk" })
-- vim.keymap.set("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", { desc = "Reset Buffer" })
-- vim.keymap.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", { desc = "Stage Hunk" })
-- vim.keymap.set("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", { desc = "Undo Stage Hunk" })

-- LSP commands
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
-- vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Document Diagnostics" })
-- vim.keymap.set("n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace Diagnostics" })
-- vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
-- vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "Installer Info" })
vim.keymap.set("n", "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnostic" })
vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "CodeLens Action" })
vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quickfix" })
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "Format Document" })

-- Terminal commands
vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", { desc = "Node" })
vim.keymap.set("n", "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", { desc = "NCDU" })
vim.keymap.set("n", "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", { desc = "Htop" })
vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", { desc = "Python" })
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float" })
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical" })

-- Buf deletion
vim.keymap.set("n", "<leader>d", "<cmd>:BufDel<CR>", { desc = "Delete Buffer" })

require("bufdel").setup({
	next = "tabs",
	quit = false, -- quit Neovim when last buffer is closed
})

-- OpenAI (ChatGPT integration) commands
-- vim.keymap.set("n", "<leader>oi", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "Edit with instructions" })
-- vim.keymap.set("n", "<leader>og", "<cmd>ChatGPT<cr>", { desc = "Open ChatGPT" })
-- vim.keymap.set("n", "<leader>oa", "<cmd>ChatGPTActAs<cr>", { desc = "ChatGPT Prompts" })
-- vim.keymap.set("n", "<leader>oc", "<cmd>ChatGPTCompleteCode<cr>", { desc = "Code Completion" })
-- vim.keymap.set("n", "<leader>ot", "<cmd>ChatGPT translate<cr>", { desc = "Translate with ChatGPT" })
-- vim.keymap.set("n", "<leader>ok", "<cmd>ChatGPT keywords<cr>", { desc = "Keywords with ChatGPT" })
-- vim.keymap.set("n", "<leader>od", "<cmd>ChatGPT docstring<cr>", { desc = "Docstring with ChatGPT" })
-- vim.keymap.set("n", "<leader>ou", "<cmd>ChatGPT add_tests<cr>", { desc = "Add tests with ChatGPT" })
-- vim.keymap.set("n", "<leader>oo", "<cmd>ChatGPT optimize_code<cr>", { desc = "Optimize code with ChatGPT" })
-- vim.keymap.set("n", "<leader>os", "<cmd>ChatGPT summarize<cr>", { desc = "Summarize with ChatGPT" })
-- vim.keymap.set("n", "<leader>of", "<cmd>ChatGPT fix_bugs<cr>", { desc = "Fix bugs with ChatGPT" })
-- vim.keymap.set("n", "<leader>oe", "<cmd>ChatGPT explain_code<cr>", { desc = "Explain code with ChatGPT" })
--
--
--
---- Search commands using Telescope
-- vim.keymap.set("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { desc = "Checkout Branch" })
-- vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })
-- vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
-- vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" })
-- vim.keymap.set("n", "<leader>sR", "<cmd>Telescope registers<cr>", { desc = "Registers" })
-- vim.keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
-- vim.keymap.set("n", "<leader>sC", "<cmd>Telescope commands<cr>", { desc = "Commands" })
