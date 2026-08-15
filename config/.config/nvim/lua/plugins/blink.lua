return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      accept = {
        auto_brackets = { enabled = false },
      },
    },
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
}
