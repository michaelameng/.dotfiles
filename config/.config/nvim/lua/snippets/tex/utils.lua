local util = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

-- Greek letters
util.greek = "\\\\alpha|\\\\beta|\\\\gamma|\\\\delta|\\\\epsilon|\\\\varepsilon|\\\\zeta|\\\\eta|\\\\theta|\\\\vartheta|"
  .. "\\\\iota|\\\\kappa|\\\\lambda|\\\\mu|\\\\nu|\\\\xi|\\\\pi|\\\\varpi|\\\\rho|\\\\varrho|\\\\sigma|\\\\varsigma|\\\\tau|"
  .. "\\\\upsilon|\\\\phi|\\\\varphi|\\\\chi|\\\\psi|\\\\omega|\\\\digamma|"
  .. "\\\\Gamma|\\\\Delta|\\\\Theta|\\\\Lambda|\\\\Xi|\\\\Pi|\\\\Sigma|\\\\Upsilon|\\\\Phi|\\\\Psi|\\\\Omega"

-- Accent markings
util.accent = "" --  TODO: Create string that works with different arguments for accents, e.g., \dot{x} vs. \dot{y}.

-- Visual selection
function util.get_visual(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

-- Clean autopair
function util.clean_autopair(char)
  vim.schedule(function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    if line:sub(col + 1, col + 1) == char then
      vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col + 1, {})
    end
  end)
end

-- Numerator parser
function util.get_numerator(line)
  local depth = 0
  local start = 1
  local idx = #line
  while idx >= 1 do
    local c = line:sub(idx, idx)
    if depth == 0 and (c == "$" or c == "`") then
      start = idx + 1
      break
    end
    if c == ")" or c == "}" or c == "]" then
      depth = depth + 1
      idx = idx - 1
    elseif c == "(" or c == "{" or c == "[" then
      depth = depth - 1
      if depth < 0 then
        start = idx + 1
        break
      end
      if depth == 0 then
        local macro_match_start = line:sub(1, idx - 1):match("\\%a+$")
        if macro_match_start then
          local bslash_idx = line:sub(1, idx - 1):find("\\%a+$")
          start = bslash_idx
          idx = bslash_idx - 1
        else
          local prev_c = line:sub(idx - 1, idx - 1)
          if prev_c == "^" or prev_c == "_" then
            idx = idx - 2
          else
            start = idx
            break
          end
        end
      else
        idx = idx - 1
      end
    elseif depth == 0 and c:match("[%+%-%=%,%s]") then
      start = idx + 1
      break
    else
      if depth == 0 and c:match("%a") then
        local macro_start = line:sub(1, idx):find("\\%a+$")
        if macro_start then
          start = macro_start
          idx = macro_start - 1
          break
        end
      end
      idx = idx - 1
    end
  end
  if idx == 0 and depth == 0 then
    start = 1
  end
  return line:sub(1, start - 1), line:sub(start)
end

-- Environment detection
local function env(name)
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- Math detection
util.in_math = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- Comment detection
util.in_comment = function()
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end

-- Beamer detection
util.in_beamer = function()
  return vim.b.vimtex["documentclass"] == "beamer"
end

-- Preamble detection
util.in_preamble = function()
  return not env("document")
end

-- Text detection
util.in_text = function()
  return not util.in_math() and not util.in_comment()
end

-- Tikz detection
util.in_tikz = function()
  return env("tikzpicture")
end

-- List detection
util.in_list = function()
  return env("itemize") or env("enumerate")
end

-- Matrix detection
util.in_matrix = function()
  return env(".*matrix.*") and util.in_math()
end

return util
