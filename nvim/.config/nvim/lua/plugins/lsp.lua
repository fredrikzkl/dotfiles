return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      autoformat = false,
      inlay_hints = { enabled = false },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
        servers = {
          gopls = {
            autoformat = false, -- Disable auto-formatting for gopls
          },
          -- Other LSP server configurations
        },
      },
    },
  },
}
