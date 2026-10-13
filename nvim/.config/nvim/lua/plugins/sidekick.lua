return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        win = {
          keys = {
            -- Double-tap Esc to force normal mode in the CLI window.
            -- Single Esc still passes through to Claude (clear/interrupt).
            stopinsert_esc = { "<esc><esc>", "stopinsert", mode = "t", desc = "enter normal mode" },
          },
        },
      },
    },
  },
}
