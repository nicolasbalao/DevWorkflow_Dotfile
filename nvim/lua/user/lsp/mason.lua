local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

if not mason_ok then
	print("Missing Mason")
	return
end

if not mason_lsp_ok then
	print("Missing Mason_lsp")
	return
end

if not lspconfig_ok then
	print("Missing lspconfig")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp.setup({
	ensure_installed = { "sumneko_lua", "tsserver", "clangd" },
})

mason_lsp.setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup({
			on_attach = require("user.lsp.handler").on_attach,
		})
	end,
})
