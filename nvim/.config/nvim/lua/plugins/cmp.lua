return {
  "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      },
    })
  end,
}
