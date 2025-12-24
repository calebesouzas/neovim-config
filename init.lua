-- // Leader Mappings // --
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- // Options // --
-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Scrolling
vim.o.scrolloff = 16

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- // Colors // --
vim.o.termguicolors = true
-- I have a custom theme called `liberty`

-- // Lazy Plugin Manager Config // --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--   local out = vim.fn.system({
--     "git", "clone", "--filter=blob:none", "--branch=stable",
--     lazyrepo, lazypath })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit..." },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
vim.opt.rtp:prepend(lazypath)
-- // Plugins // --
require("lazy").setup({
  spec = {
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {}, },
    { "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate",
      config = function()
        require"nvim-treesitter.install".compilers = {"gcc", "clang"}
        require"nvim-treesitter".setup({
          install_dir = vim.fn.stdpath("data") .. "/site"
        })
      end
    },
    { "nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"} },
    { "ThePrimeagen/harpoon", branch = "harpoon2",
      dependencies = {"nvim-lua/plenary.nvim"},
      config = function()
        Harpoon = require "harpoon"
        Harpoon:setup()
        Harpoon:extend(require"harpoon.extensions".builtins.highlight_current_file())
      end,
      keys = {
        {"<leader>a", function() Harpoon:list():add() end,
          desc = "Add to Harpoon list"},
        {"<leader>e", function()
            Harpoon.ui:toggle_quick_menu(Harpoon:list())
          end,
          desc = "Toggle Harpoon quick menu"},
        {"<leader><Tab>", function() Harpoon:list():next() end,
          desc = "Next in Harpoon list"},
        {"<leader><S-Tab>", function() Harpoon:list():prev() end,
          desc = "Previous in Harpoon list"},
        {"<leader>hf",
          function()
            local conf = require"telescope.config".values
            local file_paths = {}
            for _, item in ipairs(Harpoon:list().items) do
              table.insert(file_paths, item.value)
            end

            require "telescope.pickers".new({}, {
              prompt_title = "Harpoon Find Files",
              finder = require"telescope.finders".new_table({
                results = file_paths
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({})
            }):find()
          end,
          desc = "Telescope + Harpoon"},

      }
    },
    --@colors
    -- {
    --   "norcalli/nvim-colorizer.lua",
    --   config = function() require"colorizer".setup() end
    -- },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require "tokyonight".setup({
          style = "moon",
          styles = {
            comments  = { italic = false },
            keywords  = { italic = false },
            functions = { italic = false },
            variables = { italic = false }
          }
        })
        require "tokyonight".load()
      end
    },
    -- {
    --   dir = "~/dev/liberty.nvim",
    --   name = "liberty.nvim",
    --   opts = {}
    -- },
    {"neovim/nvim-lspconfig"},
    {
      "saghen/blink.cmp",
      dependencies = {"rafamadriz/friendly-snippets"},
      build = "cargo build --release",
      opts = {
        keymaps = {preset = "enter"},
        appearance = {
          nerd_font_variant = "mono" -- or "normal"
        },
        -- completion = { documentation = { auto_show = false } },
        sources = { default = {"lsp", "path", "snippets", "buffer"}},
        fuzzy = {implementation = "prefer_rust_with_warning"},
      },
      opts_extend = {"sources.default"}
    }
  },
  -- install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

vim.cmd("TSEnable highlight")

-- // Language Servers // --
-- Using default configurations from nvim-lspconfig
-- overriding some with 'vim.lsp.config()'...
-- For installation i just search what to do...
vim.lsp.config("pyright", {
  capabilities = require"blink.cmp".get_lsp_capabilities()
})
vim.lsp.enable("pyright")
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  },
  capabilities = require"blink.cmp".get_lsp_capabilities()
})
vim.lsp.enable("lua_ls")
vim.lsp.config("clangd", {
  capabilities = require"blink.cmp".get_lsp_capabilities()
})
vim.lsp.enable("clangd")
vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false,
  update_in_insert = false, -- or `true` to show while in insert mode
  severity_sort = true,
  underline = true,
})

