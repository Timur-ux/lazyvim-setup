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

ls.add_snippets("cmake", {
  s(
    "cpp",
    fmta(
      [[
cmake_minimum_required(VERSION 3.10)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(
	<name>
	LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD <standard>)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

file(GLOB_RECURSE SRC_FILES LIST_DIRECTORIES FALSE ./src/*.cpp)

add_library(src_lib SHARED ${SRC_FILES})

include_directories("include")

add_executable(main main.cpp)
target_link_libraries(main src_lib)

file(GLOB_RECURSE TESTS_FILES LIST_DIRECTORIES FALSE ./tests/*.cpp)
include(FetchContent)
FetchContent_Declare(
	googletest
	GIT_REPOSITORY https://github.com/google/googletest.git
	GIT_TAG        release-1.11.0
)

# For Windows: Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

add_executable(tests ${TESTS_FILES})
target_link_libraries(tests GTest::gtest_main src_lib)

include(GoogleTest)
gtest_discover_tests(tests)
]],
      { name = i(1, "ProjectName"), standard = i(2, "23") },
      defaultOpts
    )
  ),
})
