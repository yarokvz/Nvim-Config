require("luasnip").add_snippets("rust", {
    -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
    s("fn", {
        -- Simple static text.
        t("//Parameters: "),
        -- function, first parameter is the function, second the Placeholders
        -- whose text it gets as input.
        f(copy, 2),
        t({ "", "function " }),
        -- Placeholder/Insert.
        i(1),
        t("("),
        -- Placeholder with initial text.
        i(2, "int foo"),
        -- Linebreak
        t({ ") {", "\t" }),
        -- Last Placeholder, exit Point of the snippet.
        i(0),
        t({ "", "}" }),
    })
    -- filetype, snippets
})
-- )
