return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- make main background transparent
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

      -- transparency for Neo-tree
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })

      -- transparency for floating windows
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    end,
  },
}
