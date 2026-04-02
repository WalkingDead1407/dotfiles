return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  config = function()
    require("smear_cursor").setup()
  end,
}
