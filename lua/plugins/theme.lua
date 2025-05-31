return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "wave",
        transparent = true,
      })
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
}
