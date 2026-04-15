return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local pipe = "/tmp/godot.pipe"

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "gdscript", "gdresource", "gdshader" },
        callback = function()
          local port = os.getenv("GDScript_Port") or "6005"
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          vim.lsp.start({
            name = "Godot",
            cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port)),
            root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
            end,
          })
        end,
      })
    end,
  },
}
