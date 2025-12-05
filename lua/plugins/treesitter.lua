return {
  -- // Tree Sitter // --
  -- Plugin for better syntax highlight.
  -- Install a parser for a language by doing
  -- :TSInstall <language>
  -- then enable (if needed) with
  -- :TSEnable <language>
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate"
}
