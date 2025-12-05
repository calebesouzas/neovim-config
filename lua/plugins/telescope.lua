local map = require"calebesouzas.utils".map
return {
  -- // Telescope // --
  -- Fuzzy finds files and text in files or buffers

  "nvim-telescope/telescope.nvim", tag = "v0.1.9",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim", build = "make",
      config = function()
        require("telescope").setup {}
        require("telescope").load_extension("fzf")
      end
      }
  },
  config = function()
    local telescope = require "telescope.builtin"
    map("n", "<leader>ff", telescope.find_files, "Telescope Find Files")
    map("n", "<leader>fg", telescope.live_grep, "Telescope Live Grep")
    map("n", "<leader>fb", telescope.buffers, "Telescope Buffers")
    map("n", "<leader>fn", telescope.help_tags, "Telescope Help Tags")
    map("n", "<leader>fk", telescope.keymaps, "Telescope Keymaps")
  end
}
