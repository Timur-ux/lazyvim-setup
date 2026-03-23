local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local opt = require("luasnip.nodes.optional_arg")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local defaultOpts = { repeat_duplicates = true, indent_string = [[\t]] }

local tabular = function(n)
  return sn(
    n,
    fmta(
      [[
  \begin{tabular}{<cols>}
  \t<body>
  \end{tabular}
  ]],
      { cols = i(1), body = i(2) },
      defaultOpts
    )
  )
end

ls.add_snippets("tex", {
  s(
    "beg",
    fmta(
      [[
  \begin{<env>}
  \t<>
  \end{<env>}<>
  ]],
      { env = i(1, "environment"), i(2), i(0) },
      defaultOpts
    )
  ),
  s(
    "s",
    fmta(
      [[
  \section{<name>}
  <>
  ]],
      { name = i(1), i(0) },
      defaultOpts
    )
  ),
  s(
    "table",
    fmta(
      [[
  \begin{table}
  \t\caption{<caption>}
  \t<table>
  \t\label{<label>}
  \end{table}
  ]],
      { label = i(1), caption = i(2), table = tabular(3) },
      defaultOpts
    )
  ),
  s("tabular", tabular(1)),
  s(
    "fig",
    fmta(
      [[
  \begin{figure}[ht]
  \t\includegraphics[<width>]{<path>}
  \t\caption{<caption>}
  \t\label{<label>}
  \end{figure}
  ]],
      {
        width = i(2, "width=\\textwidth"),
        path = i(1, "path"),
        caption = i(3),
        label = i(4),
      },
      defaultOpts
    )
  ),
})
