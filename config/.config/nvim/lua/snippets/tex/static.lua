local util = require("snippets.tex.utils")
local get_visual = util.get_visual
local get_numerator = util.get_numerator
local clean_autopair = util.clean_autopair
local negatable = util.negatable

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

  s({
    trig = "(",
    snippetType = "autosnippet",
  }, fmta("(<>", { i(1) })),

  -- Ampersand
  s(
    {
      trig = "([^%a])amp",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Ampersand",
    },
    fmta("<>&", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- New line
  s(
    {
      trig = "([^%a])nl",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "New line",
    },
    fmta(
      [[
      <>\\
      <>
      ]],
      { f(function(_, snip)
        return snip.captures[1]
      end), d(1, get_visual) }
    ),
    { condition = util.in_math }
  ),

  -- Dots
  s({
    trig = "...",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Dots",
  }, t("\\dots"), { condition = util.in_math }),

  -- For all
  s(
    {
      trig = "([^%a^\\\\])fa",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "'For all'",
    },
    fmta("<>\\forall", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Exists
  s(
    {
      trig = "([^%a^\\\\])exx",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "'There exists'",
    },
    fmta("<>\\exists", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- In
  s(
    {
      trig = "([^%a^\\\\])inn",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "In",
    },
    fmta("<>\\in", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Plus-minus
  s(
    {
      trig = "([^%a^\\\\])pm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Plus-minus",
    },
    fmta("<>\\pm", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a])%+%-",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Plus-minus",
    },
    fmta("<>\\pm", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Dot times
  s(
    {
      trig = "([^%a])cc",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Dot times",
    },
    fmta("<>\\cdot", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a])%*%*",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Dot times",
    },
    fmta("<>\\cdot", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = util.in_math }
  ),

  -- Cross times
  s(
    {
      trig = "([^%a])xx",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Cross times",
    },
    fmta("<>\\times", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Similar
  s({
    trig = "~~",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Similar",
  }, t("\\sim"), { condition = util.in_math }),

  -- Similar or equal to
  s({
    trig = "\\sim=",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Similar equal",
  }, t("\\simeq"), { condition = util.in_math }),

  -- Approximately
  s({
    trig = "\\sim~",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Similar equal",
  }, t("\\approx"), { condition = util.in_math }),

  -- Nabla
  s(
    {
      trig = "([^%a])nb",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Nabla",
    },
    fmta("<>\\nabla", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a])gd",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Nabla",
    },
    fmta("<>\\nabla", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Real numbers
  s({
    trig = "RR",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Real numbers",
  }, t("\\mathbb{R}"), { condition = util.in_math }),

  -- Natural numbers
  s({
    trig = "NN",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Natural numbers",
  }, t("\\mathbb{N}"), { condition = util.in_math }),

  -- Integers
  s({
    trig = "ZZ",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Integers",
  }, t("\\mathbb{Z}"), { condition = util.in_math }),

  -- Rational numbers
  s({
    trig = "QQ",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Rational numbers",
  }, t("\\mathbb{Q}"), { util.in_math }),

  -- Calligraphic "L"
  s({
    trig = "LL",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Calligraphic 'L'",
  }, t("\\mathcal{L}"), { condition = util.in_math }),

  -- Calligraphic "H"
  s({
    trig = "HH",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Calligraphic 'H'",
  }, t("\\mathcal{H}"), { condition = util.in_math }),

  -- Implies
  s(
    {
      trig = "([^%a])=>",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
    },
    fmta("<>\\Rightarrow", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Implied by
  s(
    {
      trig = "([^%a])=<",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Implied by",
    },
    fmta("<>\\Leftarrow", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- If and only if
  s(
    {
      trig = "([^%a^\\\\])iff",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "If and only if",
    },
    fmta("<>\\iff", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- To
  s({
    trig = "%->",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "To",
  }, t("\\to"), { condition = util.in_math }),
  s(
    {
      trig = "([^\\\\])to",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "To",
    },
    fmta("<>\\to", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Negation
  s(
    {
      trig = "([^%a])nn",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Negation",
    },
    fmta("<>\\neg", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Logical "OR"
  s(
    {
      trig = "([^%a])lor",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Logical 'OR'",
    },
    fmta("<>\\vee", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])vee",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Logical 'OR'",
    },
    fmta("<>\\vee", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Logical "AND"
  s(
    {
      trig = "([^%a])land",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Logical 'AND'",
    },
    fmta("<>\\wedge", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])wed",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Logical 'AND'",
    },
    fmta("<>\\wedge", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Less than or equal to
  s({
    trig = "<=",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "Less than or equal to",
  }, t("\\leq"), { condition = util.in_math }),
  s(
    {
      trig = "([^%a^\\\\])leq",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Less than or equal to",
    },
    fmta("<>\\leq", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Greater than or equal to
  s(
    {
      trig = "([^%a])>=",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Greater than or equal to",
    },
    fmta("<>\\geq", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])geq",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Greater than or equal to",
    },
    fmta("<>\\geq", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Much greater than
  s({
    trig = ">>",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Much greater than",
  }, t("\\gg"), { condition = util.in_math }),

  -- Much less than
  s({
    trig = "<<",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Much less than",
  }, t("\\ll"), { condition = util.in_math }),

  -- Middle
  s(
    {
      trig = "([^%a])mid",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Middle",
    },
    fmta("<>\\mid", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Not equal to
  s({
    trig = "!=",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "Not equal to",
  }, t("\\neq"), { condition = util.in_math }),
  s(
    {
      trig = "([^\\\\])neq",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Not equal to",
    },
    fmta("<>\\neq", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Equivalent
  s({
    trig = "===",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Equivalent",
  }, t("\\equiv"), { condition = util.in_math }),

  -- Empty set
  s(
    {
      trig = "([^%a])emp",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Empty set",
    },
    fmta("<>\\varnothing", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Subset
  s(
    {
      trig = "([^%a])sub",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Subset",
    },
    fmta("<>\\subseteq", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Set "AND"
  s(
    {
      trig = "([^%a])sand",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Set 'AND'",
    },
    fmta("<>\\cap", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])cap",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Set 'AND'",
    },
    fmta("<>\\cap", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Set "OR"
  s(
    {
      trig = "([^%a])sor",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Set 'OR'",
    },
    fmta("<>\\cup", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])cup",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Set 'OR'",
    },
    fmta("<>\\cup", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Set difference
  s({
    trig = "\\\\\\",
    wordTrig = false,
    snippetType = "autosnippet",
    desc = "Set difference",
  }, t("\\setminus"), { condition = util.in_math }),
  s(
    {
      trig = "([^%a])sd",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Set difference",
    },
    fmta("<>\\setminus", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Limit
  s(
    {
      trig = "([^%a])lim",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Limit",
    },
    fmta(
      "<>\\lim_{<> \\to <>}",
      { f(function(_, snip)
        return snip.captures[1]
      end), i(1, "x"), i(2, "\\infty") }
    ),
    { condition = util.in_math }
  ),

  -- Prepend "n" or "not"
  s(
    {
      trig = "\\(%a+)n",
      wordTrig = false,
      regTrig = true,
      priority = 2000,
      snippetType = "autosnippet",
      desc = "Prepend 'n' or 'not'",
    },
    fmta("<>", {
      f(function(_, snip)
        local capture = snip.captures[1]
        local special = {
          ["in"] = "\\notin",
        }
        return special[capture] or ("\\n" .. capture)
      end),
    }),
    { condition = util.in_math }
  ),

  -- Infinity
  s(
    {
      trig = "([^%a])oo",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Infinity",
    },
    fmta("<>\\infty", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Exponential
  s(
    {
      trig = "([^\\\\])exp",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Exponential",
    },
    fmta("<>\\exp", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = util.in_math }
  ),

  -- Logarithm
  s(
    {
      trig = "([^\\\\])log",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Logarithm",
    },
    fmta("<>\\log", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "(\\log)e",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Logarithm",
    },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = util.in_math }
  ),

  -- Natural Logarithm
  s(
    {
      trig = "([^\\\\])ln",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Natural logarithm",
    },
    fmta("<>\\ln", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Trigonometry
  s(
    {
      trig = "([^%a^\\\\])sin",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Sine",
    },
    fmta("<>\\sin", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])arcsin",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Arcsine",
    },
    fmta("<>\\arcsin", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])cos",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Cosine",
    },
    fmta("<>\\cos", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])arccos",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Arccosine",
    },
    fmta("<>\\arccos", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])tan",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Tangent",
    },
    fmta("<>\\tan", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])arctan",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Arctangent",
    },
    fmta("<>\\arctan", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])csc",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Cosecant",
    },
    fmta("<>\\csc", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])sec",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Secant",
    },
    fmta("<>\\sec", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a^\\\\])cot",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Cotangent",
    },
    fmta("<>\\cot", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
}
