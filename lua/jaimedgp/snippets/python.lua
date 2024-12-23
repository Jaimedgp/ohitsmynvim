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

ls.add_snippets("python", {
    s("from", {
        t("from "), i(1), t(" import "), i(2)
    }),

    s('docs', {
        t('"""'),
        t({"", ""}), i(1),
        t({"", '"""' }),
    }),

    s('main', {
        t("if __name__ == '__main__':"),
        t({"", "    "}), i(1)
    }),

    s('init',{
        t("def __init__(self, "), i(1), t("):"),
        t({"", "    self."}), rep(1), t({" = "}), rep(1),
    }),

    s('def', {
        t("def "), i(1), t("("), i(2), t(") -> "), i(3), t(" :"),
        t({"", '"""'}), i(4), t('."""'),
        t({"", "    "}), i(4)
    }),

    s('[for', {
        t("[ "), i(1), t("for "), i(2), t(" in "), i(2), t(" ]")
    }),
})
