return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      -- Terminals (and tmux) send Ctrl+Space as NUL, which neovim reads as
      -- <C-@> (insert last text and leave insert mode), not <C-Space>.
      ["<C-@>"] = { "show", "hide" },
    },
    cmdline = {
      keymap = {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        -- Ghostty sends Ctrl+j/k as Down/Up (csi:B / csi:A), so neovim never
        -- sees <C-j>/<C-k>. The cmdline preset doesn't map the arrows.
        ["<Down>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
      },
      completion = { menu = { auto_show = true } },
    },
  },
}
