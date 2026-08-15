local util = require("snippets.tex.utils")
local get_visual = util.get_visual
local get_numerator = util.get_numerator
local clean_autopair = util.clean_autopair
local greek = util.greek

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
  -- Superscript
  -- s(
  --   {
  --     trig = "([%w%)%]%}])^",
  --     wordTrig = false,
  --     regTrig = true,
  --     snippetType = "autosnippet",
  --     desc = "Superscript",
  --   },
  --   fmta("<>^{<>}", { f(function(_, snip)
  --     return snip.captures[1]
  --   end), d(1, get_visual) }),
  --   { condition = util.in_math }
  -- ),
  s(
    {
      trig = "([%w%)%]%}]);",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Superscript",
    },
    fmta("<>^{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([%w%)%]%}])sp",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Superscript",
    },
    fmta("<>^{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Subscript
  -- s(
  --   {
  --     trig = "([%w%)%]%}])_",
  --     wordTrig = false,
  --     regTrig = true,
  --     snippetType = "autosnippet",
  --     desc = "Subscript",
  --   },
  --   fmta("<>_{<>}", { f(function(_, snip)
  --     return snip.captures[1]
  --   end), d(1, get_visual) }),
  --   { condition = util.in_math }
  -- ),
  s(
    {
      trig = "([%w%)%]%}])'",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Subscript",
    },
    fmta(
      "<>_{<>}",
      { f(function(_, snip)
        clean_autopair("'")
        return snip.captures[1]
      end), d(1, get_visual) }
    ),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([%w%)%]%}])sb",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Subscript",
    },
    fmta("<>_{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- nth root
  s(
    {
      trig = "([^%\\])nr",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "nth root",
    },
    fmta(
      "<>\\sqrt[<>]{<>}",
      { f(function(_, snip)
        return snip.captures[1]
      end), i(1, "2"), d(2, get_visual) }
    ),
    { condition = util.in_math }
  ),

  -- Inverse
  s(
    {
      trig = "([%a%)%]%}])inv",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Inverse",
    },
    fmta("<>^{-1}", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Partial derivative
  s(
    {
      trig = "([^%a])pd",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Partial derivative",
    },
    fmta(
      "<>\\frac{\\partial <>}{\\partial <>}",
      { f(function(_, snip)
        return snip.captures[1]
      end), i(1, "y"), i(2, "x") }
    ),
    { condition = util.in_math }
  ),

  -- Derivative
  s(
    {
      trig = "([^%a])df",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Derivative",
    },
    fmta("<>\\frac{d<>}{d<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, ""),
      i(2, "x"),
    }),
    { condition = util.in_math }
  ),

  -- Integral
  s(
    {
      trig = "([^%a^\\\\])int",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Integral",
    },
    fmta("<>\\int", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = util.in_math }
  ),
  s({
    trig = "\\int2",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "Integral",
  }, t("\\iint"), { condition = util.in_math }),
  s({
    trig = "\\iint3",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "Integral",
  }, t("\\iiint"), { condition = util.in_math }),
  s({
    trig = "\\int3",
    wordTrig = false,
    regTrig = true,
    snippetType = "autosnippet",
    desc = "Integral",
  }, t("\\iiint"), { condition = util.in_math }),
  s(
    {
      trig = "(\\int)e",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Integral",
    },
    fmta("<>_{<>}^{<>} <> \\, d<>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1, "a"),
      i(2, "b"),
      i(3),
      i(4, "x"),
    }),
    { condition = util.in_math }
  ),

  -- Summation
  s(
    {
      trig = "([^%a])sum",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Summation",
    },
    fmta("<>\\sum", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "(\\sum)e",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Summation",
    },
    fmta("<>_{<>}^{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), i(1, "i=1"), i(2, "n") }),
    { condition = util.in_math }
  ),

  -- Vector
  s(
    {
      trig = "([^%l])vv",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Vector",
    },
    fmta("<>\\vec{<>}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([%a])vv",
      wordTrig = false,
      regTrig = true,
      priority = 2000,
      snippetType = "autosnippet",
      desc = "Vector",
    },
    fmta("\\vec{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "(" .. greek .. ")vv",
      wordTrig = false,
      regTrig = true,
      priority = 2000,
      trigEngine = "ecma",
      snippetType = "autosnippet",
      desc = "Vector",
    },
    fmta("\\vec{<>}", { f(function(_, snip)
      return snip.captures[1]
    end) }),
    { condition = util.in_math }
  ),

  -- Fraction
  s(
    {
      trig = "//",
      wordTrig = false,
      snippetType = "autosnippet",
      desc = "Fraction",
    },
    fmta("\\frac{<>}{<>}", {
      d(1, get_visual),
      i(2),
    }),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%l])ff",
      wordTrig = false,
      snippetType = "autosnippet",
    },
    fmta("<>\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
      i(2),
    }),
    { condition = util.in_math }
  ),

  -- Autofraction
  s(
    {
      trig = "/",
      wordTrig = false,
      snippetType = "autosnippet",
      desc = "Autofraction",
      trigEngine = function(_)
        return function(line_to_cursor, _)
          if line_to_cursor:sub(-1) ~= "/" then
            return nil
          end
          local before = line_to_cursor:sub(1, -2)
          if #before == 0 then
            return nil
          end
          local _, num = get_numerator(before)
          if #num == 0 then
            return nil
          end
          local matched_text = num .. "/"
          return matched_text, { num }
        end
      end,
    },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = util.in_math }
  ),

  -- Euler's number
  s(
    {
      trig = "([^%a])ee",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Euler's number",
    },
    fmta("<>e^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = util.in_math }
  ),

  -- Absolute value
  s(
    {
      trig = "([^%a])abs",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Absolute value",
    },
    fmta("<>\\lvert <>\\rvert", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Norm
  s(
    {
      trig = "([^%a])norm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Norm",
    },
    fmta("<>\\lVert <>\\rVert", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Set
  s(
    {
      trig = "([^%a])set",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Set",
    },
    fmta("<>\\left\\{ <>\\right\\}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = util.in_math }
  ),

  -- Parenthases
  s(
    {
      trig = "([^%a])p%(",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Parentheses",
    },
    fmta(
      "<>\\left( <>\\right)",
      { f(function(_, snip)
        clean_autopair(")")
        return snip.captures[1]
      end), d(1, get_visual) }
    ),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a])p%)",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Parentheses",
    },
    fmta("<>\\left( <>\\right)", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Brackets
  s(
    {
      trig = "([^%a])p%[",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Brackets",
    },
    fmta(
      "<>\\left[ <>\\right]",
      { f(function(_, snip)
        clean_autopair("]")
        return snip.captures[1]
      end), d(1, get_visual) }
    ),
    { condition = util.in_math }
  ),
  s(
    {
      trig = "([^%a])p%]",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Brackets",
    },
    fmta("<>\\left[ <>\\right]", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) }),
    { condition = util.in_math }
  ),

  -- Braces
  s(
    {
      trig = "([^%a])p%{",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Braces",
    },
    fmta(
      "<>\\left\\{ <>\\right\\}",
      { f(function(_, snip)
        clean_autopair("}")
        return snip.captures[1]
      end), d(1, get_visual) }
    )
  ),
  s(
    {
      trig = "([^%a])p%}",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Braces",
    },
    fmta("<>\\left\\{ <>\\right\\}", { f(function(_, snip)
      return snip.captures[1]
    end), d(1, get_visual) })
  ),

  -- Chevrons
  s(
    {
      trig = "([^%a])p<",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Chevrons",
    },
    fmta(
      "[]\\left< []\\right>",
      { f(function(_, snip)
        return snip.captures[1]
      end), d(1, get_visual) },
      { delimiters = "[]" }
    )
  ),
  s(
    {
      trig = "([^%a])p>",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Chevrons",
    },
    fmta(
      "[]\\left< []\\right>",
      { f(function(_, snip)
        return snip.captures[1]
      end), d(1, get_visual) },
      { delimiters = "[]" }
    )
  ),
}
