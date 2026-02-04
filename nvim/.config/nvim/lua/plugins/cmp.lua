return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    -- Merge custom mappings with LazyVim defaults
    opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
      ["<C-j>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Insert }),
      ["<C-k>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Insert }),
    })
    return opts
  end,
}
