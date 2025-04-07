local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").pyright.setup{
	capabilities = capabilities,
}
require("lspconfig").texlab.setup{
	capabilities = capabilities,
}
require("lspconfig").nixd.setup{
	capabilities = capabilities,
}
require("lspconfig").lua_ls.setup{
	capabilities = capabilities,
}
require("lspconfig").clangd.setup{
	capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup{
	capabilities = capabilities,
}
require("lspconfig").gopls.setup{
	capabilities = capabilities,
}
