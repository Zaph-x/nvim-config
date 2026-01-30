
vim.opt.foldmethod = 'expr'
vim.opt.foldtext = ""
vim.opt.foldexpr = "v:lua.require'fold'.foldexpr()"

local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
	configs.setup({
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
			disable = { 'vim', 'vimdoc' },
		},
		ensure_installed = {
			'lua',
			'vim',
			'vimdoc',
			'query',
			'python',
		},
		auto_install = true,
		sync_install = false,
	})
end

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'vim', 'vimdoc' },
	callback = function(args)
		pcall(vim.treesitter.stop, args.buf)
	end,
})

