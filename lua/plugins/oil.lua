local map = require"calebesouzas.utils".map
return {
  -- // Oil // --
  -- File tree in a buffer.
  -- And also, open a file in a floating window
  -- using ':Oil --float <path>' command. Or
  -- ':Oil <path>' / ':edit <path>' to enter any other directory
  "stevearc/oil.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons",
    {
      "nvim-mini/mini.icons", version = "*",
      config = function()
        require("mini.icons").setup{}
      end
    }
  },
  config = function()
    require"oil".setup {
      view_options = { show_hidden = true }
    }
    map("n", "<BS>", "<CMD>Oil<CR>", "Open parent directory")
  end,
  lazy = false
}
