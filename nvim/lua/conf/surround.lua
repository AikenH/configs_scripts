-- http://github.com/ur4ltz/surround.nvim

-- require ("surround").setup(
--     {
--         mappings_style = "sandwich"
--     }
-- )

-- sr <a> to <b>：修改包裹
-- sd <a> 删除包裹<a>
-- sa <a> 增加包裹

-- and the symbol can be shown in here
-- NOTE: for easy used, we will redifine the symbols or ezly remember it

require "surround".setup {
    context_offset = 100,
    load_autogroups = false,
    mappings_style = "sandwich",
    map_insert_mode = true,
    quotes = {"'", '"'},
    brackets = {"(", '{', '['},
    space_on_closing_char = false,
    pairs = {
        nestable = { a = { "(", ")" }, s = { "[", "]" }, f = { "{", "}" }, h = { "<", ">" } },
        linear = { x = { "'", "'" }, c = { "`", "`" }, z = { '"', '"' } }
    },
    prefix = "s"
}

-- test string here

-- 1. [1,2,3]  -> "1,2,3"
-- 2. '1,2,3' -> (1,2,3)
-- 3.  1,2,3  -> anything
-- 4. "1,2,3" -> 1,2,3

-- pass test
