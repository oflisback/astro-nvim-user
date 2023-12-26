-- Execute the tests with :PlenaryBustedFile %
local utils = require "user_utils"

describe("Test calc_todo_indent_level", function()
  it(
    "verify top line in need of TODO",
    function()
      assert.are.same(2, utils.calc_todo_indent_level { "** some text that should be transformed into a TODO" })
    end
  )
  it(
    "verify indented line in need of TODO",
    function()
      assert.are.same(
        2,
        utils.calc_todo_indent_level { "*** TODO Blaha", "** some text that should be transformed into a TODO" }
      )
    end
  )
  it(
    "verify plain text inheriting parent TODO level",
    function()
      assert.are.same(
        3,
        utils.calc_todo_indent_level { "*** TODO Blaha", "some text that should be transformed into a TODO" }
      )
    end
  )
  it(
    "verify plain text inheriting parent header level + 1",
    function()
      assert.are.same(
        4,
        utils.calc_todo_indent_level {
          "*** This is a header",
          "some text without indent marker that should be transformed into a TODO",
        }
      )
    end
  )
  it(
    "verify empty line with no reference above leads to default indent level 1",
    function() assert.same(1, utils.calc_todo_indent_level { "", "" }) end
  )
end)

describe("Test Apply_TODO_transformation", function()
  it(
    "verify indented line in need of TODO",
    function()
      assert.are.same(
        2,
        utils.calc_todo_indent_level { "*** TODO Blaha", "** some text that should be transformed into a TODO" }
      )
    end
  )
  it(
    "verify plain text inheriting parent TODO level",
    function()
      assert.are.same(
        3,
        utils.calc_todo_indent_level { "*** TODO Blaha", "some text that should be transformed into a TODO" }
      )
    end
  )
  it(
    "verify plain text inheriting parent header level + 1",
    function()
      assert.are.same(
        4,
        utils.calc_todo_indent_level {
          "*** This is a header",
          "some text without indent marker that should be transformed into a TODO",
        }
      )
    end
  )
  it(
    "verify empty line with no reference above leads to default indent level 1",
    function() assert.same(1, utils.calc_todo_indent_level { "", "" }) end
  )
end)
