return {
  -- // Auto Pairs // --
  -- Automaticaly closes key pairs. Those keys are:
  -- [], '', {}, () and "".
  -- For <> you need to setup manually...
  -- or use nvim-ts-autotags for HTML...
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {}
  },
  -- // TS. Auto Tag // --
  -- Automatically closes and renames HTML tags
  {
    "windwp/nvim-ts-autotag",
    events = {"BufReadPre", "BufNewFile"},
    opts = {}
  },
  -- // Which Key // --
  -- Help devs at remembering the gigantic amount of
  -- shortcuts and key comboes that they can use in
  -- Neovim. It shows dynamically when you start using a
  -- key combo. Or every shortcut with '<leader>?'
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- // Flash // --
  -- Jumping into specific word in buffers very fast
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" },
      function() require("flash").jump() end, desc = "Flash" },

      { "S", mode = { "n", "x", "o" },
      function() require("flash").treesitter() end, desc = "Flash Treesitter" },

      { "r", mode = "o",
      function() require("flash").remote() end, desc = "Remote Flash" },

      { "R", mode = { "o", "x" },
      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },

      { "<c-s>", mode = { "c" },
      function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
  }
}
