return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
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
}
