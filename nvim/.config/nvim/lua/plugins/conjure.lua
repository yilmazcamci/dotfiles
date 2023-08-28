return {
	"Olical/conjure",
	ft = "fennel",
	config = function()
		vim.cmd([[
      let g:conjure#filetype#fennel = "conjure.client.fennel.stdio"
    ]])
	end,
}
