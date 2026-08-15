local util = require("snippets.tex.utils")
local get_visual = util.get_visual

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- Lowercase alpha
  s(
    {
      trig = "([^%w]);a",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase alpha",
    },
    fmta("<>\\alpha", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase beta
  s(
    {
      trig = "([^%w]);b",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase beta",
    },
    fmta("<>\\beta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase gamma
  s(
    {
      trig = "([^%w]);g",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase gamma",
    },
    fmta("<>\\gamma", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase gamma
  s(
    {
      trig = "([^%w]);G",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase gamma",
    },
    fmta("<>\\Gamma", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase delta
  s(
    {
      trig = "([^%w]);d",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase delta",
    },
    fmta("<>\\delta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase delta
  s(
    {
      trig = "([^%w]);D",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase delta",
    },
    fmta("<>\\Delta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase epsilon
  s(
    {
      trig = "([^%w]);e",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase epsilon",
    },
    fmta("<>\\epsilon", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Variant of lowercase epsilon
  s(
    {
      trig = "([^%w]);ve",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Variant of lowercase epsilon",
    },
    fmta("<>\\varepsilon", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase theta
  s(
    {
      trig = "([^%w]);t",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase theta",
    },
    fmta("<>\\theta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase theta
  s(
    {
      trig = "([^%w]);T",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase theta",
    },
    fmta("<>\\Theta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Variant of lowercase theta
  s(
    {
      trig = "([^%w]);vt",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Variant of lowercase theta",
    },
    fmta("<>\\vartheta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase zeta
  s(
    {
      trig = "([^%w]);z",
      wordTrig = false,
      regTrig = true,
      autosnippet = true,
      desc = "Lowercase zeta",
    },
    fmta("<>\\zeta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase iota
  s(
    {
      trig = "([^%w]);i",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase iota",
    },
    fmta("<>\\iota", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase kappa
  s(
    {
      trig = "([^%w]);k",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase kappa",
    },
    fmta("<>\\kappa", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase lambda
  s(
    {
      trig = "([^%w]);l",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase lambda",
    },
    fmta("<>\\lambda", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase lambda
  s(
    {
      trig = "([^%w]);L",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase lambda",
    },
    fmta("<>\\Lambda", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase mu
  s(
    {
      trig = "([^%w]);m",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase mu",
    },
    fmta("<>\\mu", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase nu
  s(
    {
      trig = "([^%w]);n",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase nu",
    },
    fmta("<>\\nu", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase upsilon
  s(
    {
      trig = "([^%w]);u",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase upsilon",
    },
    fmta("<>\\upsilon", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase upsilon
  s(
    {
      trig = "([^%w]);U",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase upsilon",
    },
    fmta("<>\\Upsilon", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase xi
  s(
    {
      trig = "([^%w]);x",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase xi",
    },
    fmta("<>\\xi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase pi
  s(
    {
      trig = "([^%w]);p",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase pi",
    },
    fmta("<>\\pi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^\\\\])pi",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase pi",
    },
    fmta("<>\\pi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase pi
  s(
    {
      trig = "([^%w]);P",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase pi",
    },
    fmta("<>\\Pi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^\\\\])Pi",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase pi",
    },
    fmta("<>\\Pi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase rho
  s(
    {
      trig = "([^%w]);r",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase rho",
    },
    fmta("<>\\rho", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^\\\\])rho",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase rho",
    },
    fmta("<>\\rho", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase sigma
  s(
    {
      trig = "([^%w]);s",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase sigma",
    },
    fmta("<>\\sigma", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Variant of lowercase sigma
  s(
    {
      trig = "([^%w]);vs",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Variant of lowercase sigma",
    },
    fmta("<>\\varsigma", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase tau
  s(
    {
      trig = "([^%w]);j",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase tau",
    },
    fmta("<>\\tau", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^\\\\])tau",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase tau",
    },
    fmta("<>\\tau", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase phi
  s(
    {
      trig = "([^%w]);f",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase phi",
    },
    fmta("<>\\phi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^\\\\])phi",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase phi",
    },
    fmta("<>\\phi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase phi
  s(
    {
      trig = "([^%w]);F",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase phi",
    },
    fmta("<>\\Phi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^\\\\])Phi",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase phi",
    },
    fmta("<>\\Phi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Variant of lowercase phi
  s(
    {
      trig = "([^%w]);vf",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Variant of lowercase phi",
    },
    fmta("<>\\varphi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase chi
  s(
    {
      trig = "([^%w]);c",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase chi",
    },
    fmta("<>\\chi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase psi
  s(
    {
      trig = "([^%w]);y",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase psi",
    },
    fmta("<>\\psi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase psi
  s(
    {
      trig = "([^%w]);Y",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase psi",
    },
    fmta("<>\\Psi", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase eta
  s(
    {
      trig = "([^%w]);h",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase eta",
    },
    fmta("<>\\eta", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Lowercase omega
  s(
    {
      trig = "([^%w]);o",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Lowercase omega",
    },
    fmta("<>\\omega", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Uppercase omega
  s(
    {
      trig = "([^%w]);O",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Uppercase omega",
    },
    fmta("<>\\Omega", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
}
