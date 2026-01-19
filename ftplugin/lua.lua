vim.treesitter.start()

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath("config")
          ---@diagnostic disable:undefined-field
          and (vim.uv.fs_stat(path .. "/.luarc.json")
            or vim.uv.fs_stat(path .. "/.luarc.jsonc")) then
        ---@diagnostic enable:undefined-field
        return
      end
    end
  end,
  on_attach = function()
    vim.print("Lua LSP attached!")
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      -- Faz o servidor saber da existência dos arquivos de runtime do Neovim
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      diagnostics = {
        globals = { "vim", "love", },
      },
      telemetry = { enable = false },
      codeLens = { enable = true },
      hint = { enable = true, semicolon = "Disable" },
    }
  }
})

vim.lsp.enable("lua_ls")
