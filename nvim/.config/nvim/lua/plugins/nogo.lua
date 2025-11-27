return {
  "https://github.com/TheNoeTrevino/no-go.nvim",
  name = "no-go.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = "go",
  opts = {
    enabled = false,
    reveal_on_cursor = false,
    -- Your configuration here (optional)
    -- lazy.nvim automatically calls setup() with the opts property
    identifiers = { "err", "error" }, -- Customize which identifiers to collapse
    -- look at the default config for more details
  },
}
