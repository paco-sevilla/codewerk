#define CATCH_CONFIG_MAIN

#include "hello/hello.hpp"
#include <catch2/catch.hpp>

TEST_CASE("Test hello") { REQUIRE(hello() == "Hello World!"); }
