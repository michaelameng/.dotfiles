return {
  -- blink.cmp
  {
    "saghen/blink.cmp",
    name = "blink.cmp",
    opts = {
      keymap = {
        ["<CR>"] = {
          "accept",
          "fallback",
        },
        ["<Tab>"] = {
          "snippet_forward",
          "accept",
          "fallback",
        },
        ["<S-Tab>"] = {
          "snippet_backward",
          "fallback",
        },
      },
    },
  },

  -- luasnip
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    name = "luasnip",
    config = function(_, opts)
      require("luasnip").setup(opts)
      require("luasnip.loaders.from_lua").load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })
    end,
    opts = {
      history = true,
      region_check_events = "InsertEnter",
      delete_check_events = "InsertLeave",
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    },
  },

  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- vimtex
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_activate = 1
    end,
  },
}
