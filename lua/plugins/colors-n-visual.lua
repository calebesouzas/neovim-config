return {
  -- // Highlight Colors // --
  -- Plugin to highlight hexadecimal colors.
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {}
  },
  -- // Tokyo Night // --
  -- Another color scheme. For some reason i really like this one.
  -- But i gotta learn how to disable italic formatting...
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require "tokyonight".setup{
	style = "moon",
        styles = {
	  comments  = { italic = false },
	  keywords  = { italic = false },
	  functions = { italic = false },
	  variables = { italic = false }
	}
      }
      require "tokyonight".load()
    end
  },
  -- // Lua Line // --
  -- A plugin to make the bottom bar look better.
  -- With some useful informations also.
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require "lualine".setup {options={
	theme = "tokyonight"}}
    end
  },
  -- // Todo Comments // --
  -- Highlights comment lines starting with any of these keywords:
  -- PERF, WARNING, HACK, FIX, TODO, NOTE
  -- I'm sure that it works in Lua, but not on other languages
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  -- // CodeSnap // --
  -- To save a little image of any selected code block
  -- into the clipboard. I'll try it in Termux and KDE Plasma
  -- {
  --   "mistricky/codesnap.nvim",
  --   build = "make",
  --   opts = {
  --     save_path = "~/Pictures",
  --     bg_theme = "grape" -- with blue and purple
  --   }
  -- }
}
