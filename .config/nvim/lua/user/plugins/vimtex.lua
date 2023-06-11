return {
	'lervag/vimtex',
	config = function()
		vim.g.vimtex_compiler_latexmk = {
			build_dir = ".out",
			options = {
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-interaction=nonstopmode",
				"-synctex=1",
			},
		}
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_engine = 'lualatex'
	end
}
