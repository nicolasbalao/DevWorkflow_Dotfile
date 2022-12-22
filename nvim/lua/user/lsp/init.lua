--https://riptutorial.com/lua/example/16000/using-pcall
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("Missing lspconfig")
	return
end

require("user.lsp.handler")
require("user.lsp.mason")
