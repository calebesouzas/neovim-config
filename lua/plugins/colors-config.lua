return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.install").prefer_git = false
      require("nvim-treesitter.install").compilers = { "gcc" }
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "c_sharp", "rust" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   config = function()
  --     require("rose-pine").setup({
  --       variant = "main",
  --       styles = {
  --         bold = true,
  --         italic = false,
  --         transparency = false,
  --       },
  --     })
  --     vim.cmd("colorscheme rose-pine")
  --   end,
  -- },
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme moonfly")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "rktjmp/lush.nvim",
    { dir = "E:/DEVMODE/NvimPlugins/feel-good/" },
    enabled = false,
  },
  {
    dir = "E:/DEVMODE/NvimPlugins/feel-good",
    name = "feel-good",
    config = function()
      require("feel-good").setup()
    end,
    enabled = false,
  }
}
