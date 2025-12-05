return {
  on_attach = function()
    print("C# LSP started!")
  end,
  capabilities = require "cmp_nvim_lsp".default_capabilities(),
  settings = {
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
    },
    ["dotnet|code-lens"] = {
      dotnet_enable_references_code_lens = true,
    }
  }
}
