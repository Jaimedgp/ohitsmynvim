local ls = require("luasnip")
local s = ls.snippet
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
-- local fmt = require("luasnip.extras.fmt").fmt
-- local c = ls.choice_node
-- local f = ls.function_node
-- local d = ls.dynamic_node
-- local sn = ls.snippet_node

ls.add_snippets("markdown", {
    s("tree", {
        t(" HOME"),
        t({"", "├──  folder"}),
        t({"", "│   ├──  folder"}),
        t({"", "│   ├──  Untitled.ipynb"}),
        t({"", "│   └──  python.py"}),
        t({"", "├──  folder"}),
        t({"", "│   ├──  python.py"}),
        t({"", "│   └──  epoca0_test_results.png"}),
        t({"", "├──  python.py"}),
        t({"", "├──  Dockerfile"}),
        t({"", "├──  README.md"}),
        t({"", "└──  uv.lock`"}),
    }),
    s("bash", {
        t("```bash"),
        t({"", ""}), i(1),
        t({"", "```"}),
    }),
    s("python", {
        t("```python"),
        t({"", ""}), i(1),
        t({"", "```"}),
    }),
})
