local map = require"calebesouzas.utils".map
return {
  -- // Harpoon // --
  -- With this one we can add the current buffer to a list,
  -- open another buffer, add it too, then we have both
  -- buffers with easy access. 
  -- Without looking for each file every time.
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    local harpoon = require "harpoon"
    harpoon:setup({})
    -- Harpoon keymaps --
    map("n", "<leader>a",
    function() harpoon:list():add() end,
    "Add current file into Harpoon list")

    map("n", "<leader>e",
    function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    "Toggle Harpoon quick menu")

    -- The two mappings below are for quick switching
    -- between files added to Harpoon list
    map("n", "<C-S-P>",
    function() harpoon:list():prev() end,
    "Go to previous file in Harpoon list")

    map("n", "<C-S-N>",
    function() harpoon:list():next() end,
    "Go to next file in Harpoon list")

    for num = 1, 9 do
      map("n", "<Tab>"..tostring(num),
      function() harpoon:list():select(num) end,
      tostring(num).." in Harpoon List")
    end
  end
}
