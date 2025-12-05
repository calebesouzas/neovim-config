return {
  "rachartier/tiny-inline-diagnostic.nvim",
  -- May change event or set 'lazy' to false
  -- if it don't start automatically when i
  -- enter a buffer that has a LSP attached
  events = { "VeryLazy", "BufReadPre", "LspAttach" },
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "simple",
      options = {
	multilines = {
	  enabled = true,
	  always_show = true,
	  trim_whitespaces = true
	},
	show_source = { enabled = true },
	show_all_diags_on_cursorline = true,
      }
    })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
