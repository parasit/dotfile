vim.pack.add{
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' }
}

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
    "gopls",
    "pyright",
	}
})
