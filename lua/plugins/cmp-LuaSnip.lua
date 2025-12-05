return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    {
      "swplayerMC/LuaSnip-by-L3M0N4D3",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
      },
      build = "make install_jsregexp",
      -- TODO: Don't forget to fix potentialy
      -- conflicting keymaps

      config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_vscode").lazy_load()

        vim.keymap.set({"i"}, "<C-K>", function()
          ls.expand() end,
        {silent = true})

        vim.keymap.set({"i", "s"}, "<C-L>", function()
          ls.jump( 1) end,
        {silent = true})

        vim.keymap.set({"i", "s"}, "<C-J>", function()
          ls.jump(-1) end,
        {silent = true})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end,
        {silent = true})
      end
    }
  },
  config = function()
    local cmp = require"cmp"
    cmp.setup({
      snippet = {
        extend = function(args)
          require"luasnip".lsp_expand(args.body)
          vim.snippet.expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert{
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm{ select = false },
	      -- Accept currently selected item. Set to `false` 
	      -- to only confirm explicitly selected items.
      },
      sources = cmp.config.sources{
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        -- { name = "path" },
      }, {
        -- { name = 'buffer' },
      }
    })
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
        { name = "path" },
      }
    })
    -- TODO: Don't forget to require and setup
    -- capabilities for every LSP.
  end
}
