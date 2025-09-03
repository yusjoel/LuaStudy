-- Demonstration of String Assertions in LuaUnit
-- String assertion functions: assertStrContains, assertNotStrContains, assertStrIContains, assertNotStrIContains, assertStrMatches
-- Run with: lua testStringAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- Test strings for string assertions
-- =======================================

local str1 = "Hello World"
local str2 = "Programming in Lua"
local str3 = "HELLO WORLD"
local str4 = "hello world"
local str5 = "The quick brown fox jumps over the lazy dog"
local str6 = ""  -- empty string
local str7 = "123-456-7890"
local str8 = "user@example.com"
local str9 = "2023-09-02"
local str10 = "Mixed Case String"

-- Test substrings and patterns
local substr1 = "Hello"
local substr2 = "World"
local substr3 = "HELLO"
local substr4 = "world"
local substr5 = "Programming"
local substr6 = "Lua"
local substr7 = "xyz"  -- not found in any string
local substr8 = "quick"
local substr9 = "fox"
local substr10 = ""  -- empty substring

-- Patterns for assertStrMatches
local pattern1 = "^Hello.*"  -- starts with Hello and matches the rest
local pattern2 = ".*World$"  -- matches anything ending with World
local pattern3 = "%d+%-%d+%-%d+"  -- phone number pattern
local pattern4 = ".+@.+%.%w+"  -- email pattern
local pattern5 = "%d%d%d%d%-%d%d%-%d%d"  -- date pattern
local pattern6 = "%a+"  -- only letters
local pattern7 = "%d+"  -- only digits
local pattern8 = "^$"  -- empty string pattern
local pattern9 = ".*"  -- matches everything
local pattern10 = "%l+"  -- lowercase letters

-- =======================================
-- assertStrContains tests
-- =======================================

function testAssertStrContainsHelloInHelloWorld()
    lu.assertStrContains(str1, substr1)  -- Should pass: "Hello" in "Hello World"
end

function testAssertStrContainsWorldInHelloWorld()
    lu.assertStrContains(str1, substr2)  -- Should pass: "World" in "Hello World"
end

function testAssertStrContainsProgrammingInProgrammingLua()
    lu.assertStrContains(str2, substr5)  -- Should pass: "Programming" in "Programming in Lua"
end

function testAssertStrContainsLuaInProgrammingLua()
    lu.assertStrContains(str2, substr6)  -- Should pass: "Lua" in "Programming in Lua"
end

function testAssertStrContainsQuickInQuickBrownFox()
    lu.assertStrContains(str5, substr8)  -- Should pass: "quick" in "The quick brown fox..."
end

function testAssertStrContainsFoxInQuickBrownFox()
    lu.assertStrContains(str5, substr9)  -- Should pass: "fox" in "The quick brown fox..."
end

function testAssertStrContainsEmptyInHelloWorld()
    lu.assertStrContains(str1, substr10)  -- Should pass: empty string is contained in any string
end

function testAssertStrContainsXyzInHelloWorld()
    -- Should fail: "xyz" not in "Hello World" - use pcall to catch the error
    local success, err = pcall(lu.assertStrContains, str1, substr7)
    lu.assertFalse(success)  -- Should fail due to substring not found
end

function testAssertStrContainsHelloInEmptyString()
    -- Should fail: "Hello" not in empty string - use pcall to catch the error
    local success, err = pcall(lu.assertStrContains, str6, substr1)
    lu.assertFalse(success)  -- Should fail due to empty string
end

function testAssertStrContainsHelloUpperInHelloWorld()
    -- Should fail: "HELLO" not in "Hello World" (case sensitive) - use pcall to catch the error
    local success, err = pcall(lu.assertStrContains, str1, substr3)
    lu.assertFalse(success)  -- Should fail due to case sensitivity
end

-- =======================================
-- assertNotStrContains tests
-- =======================================

function testAssertNotStrContainsXyzInHelloWorld()
    lu.assertNotStrContains(str1, substr7)  -- Should pass: "xyz" not in "Hello World"
end

function testAssertNotStrContainsHelloUpperInHelloWorld()
    lu.assertNotStrContains(str1, substr3)  -- Should pass: "HELLO" not in "Hello World" (case sensitive)
end

function testAssertNotStrContainsWorldLowerInHelloWorld()
    lu.assertNotStrContains(str1, substr4)  -- Should pass: "world" not in "Hello World" (case sensitive)
end

function testAssertNotStrContainsHelloInEmptyString()
    lu.assertNotStrContains(str6, substr1)  -- Should pass: "Hello" not in empty string
end

function testAssertNotStrContainsXyzInProgrammingLua()
    lu.assertNotStrContains(str2, substr7)  -- Should pass: "xyz" not in "Programming in Lua"
end

function testAssertNotStrContainsHelloInHelloWorld()
    -- Should fail: "Hello" is in "Hello World" - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrContains, str1, substr1)
    lu.assertFalse(success)  -- Should fail because substring is found
end

function testAssertNotStrContainsWorldInHelloWorld()
    -- Should fail: "World" is in "Hello World" - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrContains, str1, substr2)
    lu.assertFalse(success)  -- Should fail because substring is found
end

function testAssertNotStrContainsProgrammingInProgrammingLua()
    -- Should fail: "Programming" is in "Programming in Lua" - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrContains, str2, substr5)
    lu.assertFalse(success)  -- Should fail because substring is found
end

function testAssertNotStrContainsEmptyInHelloWorld()
    -- Should fail: empty string is contained in any string - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrContains, str1, substr10)
    lu.assertFalse(success)  -- Should fail because empty string is always contained
end

function testAssertNotStrContainsQuickInQuickBrownFox()
    -- Should fail: "quick" is in "The quick brown fox..." - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrContains, str5, substr8)
    lu.assertFalse(success)  -- Should fail because substring is found
end

-- =======================================
-- assertStrIContains tests (case insensitive)
-- =======================================

function testAssertStrIContainsHelloUpperInHelloWorld()
    lu.assertStrIContains(str1, substr3)  -- Should pass: "HELLO" in "Hello World" (case insensitive)
end

function testAssertStrIContainsWorldLowerInHelloWorld()
    lu.assertStrIContains(str1, substr4)  -- Should pass: "world" in "Hello World" (case insensitive)
end

function testAssertStrIContainsHelloLowerInHelloUpper()
    lu.assertStrIContains(str3, substr1)  -- Should pass: "Hello" in "HELLO WORLD" (case insensitive)
end

function testAssertStrIContainsWorldUpperInHelloLower()
    lu.assertStrIContains(str4, substr2)  -- Should pass: "World" in "hello world" (case insensitive)
end

function testAssertStrIContainsLuaLowerInProgrammingLua()
    lu.assertStrIContains(str2, "lua")  -- Should pass: "lua" in "Programming in Lua" (case insensitive)
end

function testAssertStrIContainsProgrammingUpperInProgrammingLua()
    lu.assertStrIContains(str2, "PROGRAMMING")  -- Should pass: "PROGRAMMING" in "Programming in Lua" (case insensitive)
end

function testAssertStrIContainsQuickUpperInQuickBrownFox()
    lu.assertStrIContains(str5, "QUICK")  -- Should pass: "QUICK" in "The quick brown fox..." (case insensitive)
end

function testAssertStrIContainsXyzInHelloWorld()
    -- Should fail: "xyz" not in "Hello World" even case insensitive - use pcall to catch the error
    local success, err = pcall(lu.assertStrIContains, str1, substr7)
    lu.assertFalse(success)  -- Should fail because substring doesn't exist
end

function testAssertStrIContainsHelloInEmptyString()
    -- Should fail: "Hello" not in empty string - use pcall to catch the error
    local success, err = pcall(lu.assertStrIContains, str6, substr1)
    lu.assertFalse(success)  -- Should fail because of empty string
end

function testAssertStrIContainsEmptyInHelloWorld()
    lu.assertStrIContains(str1, substr10)  -- Should pass: empty string is contained in any string
end

-- =======================================
-- assertNotStrIContains tests (case insensitive)
-- =======================================

function testAssertNotStrIContainsXyzInHelloWorld()
    lu.assertNotStrIContains(str1, substr7)  -- Should pass: "xyz" not in "Hello World"
end

function testAssertNotStrIContainsHelloInEmptyString()
    lu.assertNotStrIContains(str6, substr1)  -- Should pass: "Hello" not in empty string
end

function testAssertNotStrIContainsXyzUpperInProgrammingLua()
    lu.assertNotStrIContains(str2, "XYZ")  -- Should pass: "XYZ" not in "Programming in Lua"
end

function testAssertNotStrIContainsRandomInQuickBrownFox()
    lu.assertNotStrIContains(str5, "RANDOM")  -- Should pass: "RANDOM" not in "The quick brown fox..."
end

function testAssertNotStrIContainsAbcInMixedCase()
    lu.assertNotStrIContains(str10, "ABC")  -- Should pass: "ABC" not in "Mixed Case String"
end

function testAssertNotStrIContainsHelloUpperInHelloWorld()
    -- Should fail: "HELLO" is in "Hello World" (case insensitive) - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrIContains, str1, substr3)
    lu.assertFalse(success)  -- Should fail because substring is found (case insensitive)
end

function testAssertNotStrIContainsWorldLowerInHelloWorld()
    -- Should fail: "world" is in "Hello World" (case insensitive) - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrIContains, str1, substr4)
    lu.assertFalse(success)  -- Should fail because substring is found (case insensitive)
end

function testAssertNotStrIContainsLuaLowerInProgrammingLua()
    -- Should fail: "lua" is in "Programming in Lua" (case insensitive) - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrIContains, str2, "lua")
    lu.assertFalse(success)  -- Should fail because substring is found (case insensitive)
end

function testAssertNotStrIContainsQuickUpperInQuickBrownFox()
    -- Should fail: "QUICK" is in "The quick brown fox..." (case insensitive) - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrIContains, str5, "QUICK")
    lu.assertFalse(success)  -- Should fail because substring is found (case insensitive)
end

function testAssertNotStrIContainsEmptyInHelloWorld()
    -- Should fail: empty string is contained in any string - use pcall to catch the error
    local success, err = pcall(lu.assertNotStrIContains, str1, substr10)
    lu.assertFalse(success)  -- Should fail because empty string is always contained
end

-- =======================================
-- assertStrMatches tests (pattern matching)
-- =======================================

function testAssertStrMatchesHelloWorldStartsWithHello()
    lu.assertStrMatches(str1, pattern1)  -- Should pass: "Hello World" starts with "Hello"
end

function testAssertStrMatchesHelloWorldEndsWithWorld()
    lu.assertStrMatches(str1, pattern2)  -- Should pass: "Hello World" ends with "World"
end

function testAssertStrMatchesPhoneNumberWithPhonePattern()
    lu.assertStrMatches(str7, pattern3)  -- Should pass: "123-456-7890" matches phone pattern
end

function testAssertStrMatchesEmailWithEmailPattern()
    lu.assertStrMatches(str8, pattern4)  -- Should pass: "user@example.com" matches email pattern
end

function testAssertStrMatchesDateWithDatePattern()
    lu.assertStrMatches(str9, pattern5)  -- Should pass: "2023-09-02" matches date pattern
end

function testAssertStrMatchesHelloWorldWithLettersPattern()
    -- Should fail: "Hello World" has space, %a+ only matches continuous letters - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str1, pattern6)
    lu.assertFalse(success)  -- Should fail because of space in string
end

function testAssertStrMatchesPhoneWithDigitsPattern()
    -- Should fail: "123-456-7890" has hyphens, %d+ only matches continuous digits - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str7, pattern7)
    lu.assertFalse(success)  -- Should fail because of hyphens in phone number
end

function testAssertStrMatchesEmptyStringWithEmptyPattern()
    lu.assertStrMatches(str6, pattern8)  -- Should pass: empty string matches empty pattern
end

function testAssertStrMatchesHelloWorldWithEverythingPattern()
    lu.assertStrMatches(str1, pattern9)  -- Should pass: "Hello World" matches ".*"
end

function testAssertStrMatchesHelloWorldWithDigitsPattern()
    -- Should fail: "Hello World" doesn't match digits only pattern - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str1, pattern7)
    lu.assertFalse(success)  -- Should fail because string contains letters, not digits
end

function testAssertStrMatchesPhoneWithEmailPattern()
    -- Should fail: phone number doesn't match email pattern - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str7, pattern4)
    lu.assertFalse(success)  -- Should fail because phone number doesn't match email pattern
end

function testAssertStrMatchesEmailWithPhonePattern()
    -- Should fail: email doesn't match phone pattern - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str8, pattern3)
    lu.assertFalse(success)  -- Should fail because email doesn't match phone pattern
end

function testAssertStrMatchesHelloWorldWithLowercasePattern()
    -- Should fail: "Hello World" has uppercase letters - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str1, pattern10)
    lu.assertFalse(success)  -- Should fail because string contains uppercase letters
end

function testAssertStrMatchesEmptyStringWithLettersPattern()
    -- Should fail: empty string doesn't contain letters - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str6, pattern6)
    lu.assertFalse(success)  -- Should fail because empty string has no letters
end

function testAssertStrMatchesDateWithEmailPattern()
    -- Should fail: date doesn't match email pattern - use pcall to catch the error
    local success, err = pcall(lu.assertStrMatches, str9, pattern4)
    lu.assertFalse(success)  -- Should fail because date format doesn't match email pattern
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
