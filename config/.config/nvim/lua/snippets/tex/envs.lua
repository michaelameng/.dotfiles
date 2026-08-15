local util = require("snippets.tex.utils")
local get_visual = util.get_visual
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local clean_autopair = util.clean_autopair

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- Inline math
  s(
    {
      trig = "([^%l])mk",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Inline math",
    },
    fmta("<>$<>$", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_text }
  ),

  -- Inline math on new line
  s({
    trig = "^mk",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "Inline math on new line",
  }, fmta("$<>$", { d(1, get_visual) }), { condition = line_begin and util.in_text }),

  -- Display math
  s(
    { trig = "dm", snippetType = "autosnippet", desc = "Display math" },
    fmta(
      [[
      \[
        <>
      \]
      ]],
      { d(1, get_visual) }
    ),
    { condition = line_begin and util.in_text }
  ),

  -- Generic environment
  s(
    {
      trig = "bb",
      snippetType = "autosnippet",
      desc = "Generic environment",
    },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      { i(1), d(2, get_visual), rep(1) }
    ),
    { condition = line_begin and util.in_text }
  ),

  -- Environment with mandatory option
  s(
    {
      trig = "mbb",
      snippetType = "autosnippet",
      desc = "Environment with mandatory option",
    },
    fmta(
      [[
      \begin{<>}{<>}
        <>
      \end{<>}
      ]],
      { i(1), i(2), d(3, get_visual), rep(1) }
    ),
    { condition = line_begin and util.in_text }
  ),

  -- Environment with mandatory option
  s(
    {
      trig = "obb",
      snippetType = "autosnippet",
      desc = "Environment with optional option",
    },
    fmta(
      [[
      \begin{<>}[<>]
        <>
      \end{<>}
      ]],
      { i(1), i(2), d(3, get_visual), rep(1) }
    ),
    { condition = line_begin and util.in_text }
  ),

  -- Text environment
  s(
    {
      trig = [[([^%a])"]],
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Text environment",
    },
    fmta(
      "<>\z
      \\text{<>}",
      { f(function(_, snip)
        clean_autopair('"')
        return snip.captures[1]
      end), d(1, get_visual) }
    ),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a])text",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Text environment",
    },
    fmta("<>\\text{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),
}
