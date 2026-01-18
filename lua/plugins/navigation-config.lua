-- Telescope Finders
-- Functions	                              Description
-- builtin.lsp_references	                  Lists LSP references for word under the cursor
-- builtin.lsp_incoming_calls	              Lists LSP incoming calls for word under the cursor
-- builtin.lsp_outgoing_calls	              Lists LSP outgoing calls for word under the cursor
-- builtin.lsp_document_symbols	            Lists LSP document symbols in the current buffer
-- builtin.lsp_workspace_symbols	          Lists LSP document symbols in the current workspace
-- builtin.lsp_dynamic_workspace_symbols	  Dynamically Lists LSP for all workspace symbols
-- builtin.diagnostics	                    Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
-- builtin.lsp_implementations	            Goto the implementation of the word under the cursor if there's only one, otherwise shows all
-- builtin.lsp_definitions	                Goto the definition of the word under the cursor, if there's only one, otherwise shows all
-- builtin.lsp_type_definitions	            Goto the definition of the type of the word under the cursor, if there's only one, otherwise shows all


return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      vim.keymap.set("n", "<leader>t", ":Telescope ")
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<leader>e", function()
        local conf = require("telescope.config").values
        local file_paths = {}
        for _, item in ipairs(harpoon:list().items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end)

      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
  }
}
