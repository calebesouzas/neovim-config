return {
  -- // Persistence // --
  -- Save what file we're editing in the current session
  -- so we can restore it in the next time we enter Neovim.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {}
  }
}
