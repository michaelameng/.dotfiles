local util = require("snippets.tex.utils")
local get_visual = util.get_visual
local greek = util.greek

local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  -- Text bold font
  s(
    {
      trig = "([^%a])tbf",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Text bold font",
    },
    fmta("<>\\textbf{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_text }
  ),

  -- Text italic font
  s(
    {
      trig = "([^%a])tii",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Text italic font",
    },
    fmta("<>\\emph{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_text }
  ),

  -- Text typewriter font
  s(
    {
      trig = "([^%a])ttt",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Text typewriter font",
    },
    fmta("<>\\textt{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_text }
  ),

  -- Math bold font
  s(
    {
      trig = "([^%a])mbf",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Math bold font",
    },
    fmta("<>\\mathbf{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([%a]),%.",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Math bold font",
    },
    fmta("\\mathbf{<>}", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([%a])%.,",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Math bold font",
    },
    fmta("\\mathbf{<>}", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Math italic bold font
  s(
    {
      trig = "([^%a])mbs",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Math italic bold font",
    },
    fmta("<>\\boldsymbol{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "(" .. greek .. "),\\.",
      wordTrig = false,
      regTrig = true,
      priority = 2000,
      trigEngine = "ecma",
      snippetType = "autosnippet",
      desc = "Math italic bold font",
    },
    fmta("\\boldsymbol{<>}", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "(" .. greek .. ")\\.,",
      wordTrig = false,
      regTrig = true,
      priority = 2000,
      trigEngine = "ecma",
      snippetType = "autosnippet",
      desc = "Math italic bold font",
    },
    fmta("\\boldsymbol{<>}", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Math roman font
  s(
    {
      trig = "([^%a])mrm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Math roman font",
    },
    fmta("<>\\mathrm{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Math caligraphy font
  s(
    {
      trig = "([^%a])mcl",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Math caligraphy font",
    },
    fmta("<>\\mathcal{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Math blackboard font
  s(
    {
      trig = "([^%a])mbb",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      desc = "Math blackboard font",
    },
    fmta("<>\\mathbb{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = util.in_math }
  ),
}
