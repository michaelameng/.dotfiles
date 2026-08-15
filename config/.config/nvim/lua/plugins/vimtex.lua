return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_sioyek_sync = 1
      vim.g.vimtex_view_sioyek_activate = 1
    end,
  },
}
