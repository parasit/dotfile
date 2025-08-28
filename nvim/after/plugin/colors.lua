function MyColors(color)
	-- color = color or "slate"
    color = color or "darkplus"
    --color = color or "tokyonight"
	vim.cmd.colorscheme(color)
end

MyColors()
