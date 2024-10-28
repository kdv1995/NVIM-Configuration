local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lsp_config = require("mason-lspconfig")
mason.setup()
mason_lsp_config.setup()

-- Function to show diagnostics automatically
local function lsp_diagnostics_autocmd()
	vim.diagnostic.config({
		virtual_text = true, -- Show diagnostics as virtual text
		signs = true, -- Show signs in the gutter
		underline = true, -- Underline diagnostics in the text
		update_in_insert = false, -- Don't show diagnostics in insert mode
	})

	-- Create autocommands for displaying diagnostics
	vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold" }, {
		pattern = { "*" },
		callback = function()
			vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
		end,
	})
end

-- Attach diagnostics function to LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			lsp_diagnostics_autocmd()
		end
	end,
})

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = false, -- disable virtual text
	signs = {
		active = signs, -- show signs
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Enable snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Example of extending capabilities using nvim-cmp
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local function lsp_keymap(bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

lspconfig.ts_ls.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	on_capabilities = capabilities,
})
--
lspconfig.solidity_ls.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	on_capabilities = capabilities,
})
--
lspconfig.solidity_ls_nomicfoundation.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	on_capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	on_capabilities = capabilities,
})

lspconfig.cssls.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.jsonls.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	capabilities = capabilities,
})

lspconfig.css_variables.setup({
	{
		on_attach = function(_, bufnr)
			lsp_keymap(bufnr)
		end,
		capabilities = capabilities,
	},
})
lspconfig.bashls.setup({
	on_attach = function(_, bufnr)
		lsp_keymap(bufnr)
	end,
	on_capabilities = capabilities,
})
