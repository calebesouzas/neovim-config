return {
  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp"
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      completion = {
        menu = {
          auto_show = true,
        },
        documentation = {
          auto_show = true
        },
      },
    },
  }
}
