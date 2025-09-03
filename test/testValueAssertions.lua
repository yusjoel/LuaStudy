-- Demonstration of Value Assertions in LuaUnit
-- Complete test matrix: Each assertion function tested with each value
-- Values: true, false, 1, 0, "hello", "", nil, {}, function() end, coroutine.create(function() end)
-- Run with: lua testValueAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- assertEvalToTrue with all test values
-- =======================================

function testAssertEvalToTrueWithTrue()
    lu.assertEvalToTrue(true)  -- Should pass
end

function testAssertEvalToTrueWithFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToTrue, false)
    lu.assertFalse(success)  -- Should fail because false evaluates to false
end

function testAssertEvalToTrueWithOne()
    lu.assertEvalToTrue(1)  -- Should pass
end

function testAssertEvalToTrueWithZero()
    lu.assertEvalToTrue(0)  -- Should pass
end

function testAssertEvalToTrueWithHello()
    lu.assertEvalToTrue("hello")  -- Should pass
end

function testAssertEvalToTrueWithEmptyString()
    lu.assertEvalToTrue("")  -- Should pass
end

function testAssertEvalToTrueWithNil()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToTrue, nil)
    lu.assertFalse(success)  -- Should fail because nil evaluates to false
end

function testAssertEvalToTrueWithTable()
    lu.assertEvalToTrue({})  -- Should pass
end

function testAssertEvalToTrueWithFunction()
    lu.assertEvalToTrue(function() end)  -- Should pass
end

function testAssertEvalToTrueWithCoroutine()
    lu.assertEvalToTrue(coroutine.create(function() end))  -- Should pass
end

-- =======================================
-- assertEvalToFalse with all test values
-- =======================================

function testAssertEvalToFalseWithTrue()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, true)
    lu.assertFalse(success)  -- Should fail because true evaluates to true
end

function testAssertEvalToFalseWithFalse()
    lu.assertEvalToFalse(false)  -- Should pass
end

function testAssertEvalToFalseWithOne()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, 1)
    lu.assertFalse(success)  -- Should fail because 1 evaluates to true
end

function testAssertEvalToFalseWithZero()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, 0)
    lu.assertFalse(success)  -- Should fail because 0 evaluates to true
end

function testAssertEvalToFalseWithHello()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, "hello")
    lu.assertFalse(success)  -- Should fail because "hello" evaluates to true
end

function testAssertEvalToFalseWithEmptyString()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, "")
    lu.assertFalse(success)  -- Should fail because "" evaluates to true
end

function testAssertEvalToFalseWithNil()
    lu.assertEvalToFalse(nil)  -- Should pass
end

function testAssertEvalToFalseWithTable()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, {})
    lu.assertFalse(success)  -- Should fail because {} evaluates to true
end

function testAssertEvalToFalseWithFunction()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, function() end)
    lu.assertFalse(success)  -- Should fail because functions evaluate to true
end

function testAssertEvalToFalseWithCoroutine()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertEvalToFalse, coroutine.create(function() end))
    lu.assertFalse(success)  -- Should fail because coroutines evaluate to true
end

-- =======================================
-- assertTrue with all test values
-- =======================================

function testAssertTrueWithTrue()
    lu.assertTrue(true)  -- Should pass
end

function testAssertTrueWithFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, false)
    lu.assertFalse(success)  -- Should fail because false is not exactly true
end

function testAssertTrueWithOne()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, 1)
    lu.assertFalse(success)  -- Should fail because 1 is not exactly true
end

function testAssertTrueWithZero()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, 0)
    lu.assertFalse(success)  -- Should fail because 0 is not exactly true
end

function testAssertTrueWithHello()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, "hello")
    lu.assertFalse(success)  -- Should fail because "hello" is not exactly true
end

function testAssertTrueWithEmptyString()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, "")
    lu.assertFalse(success)  -- Should fail because "" is not exactly true
end

function testAssertTrueWithNil()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, nil)
    lu.assertFalse(success)  -- Should fail because nil is not exactly true
end

function testAssertTrueWithTable()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, {})
    lu.assertFalse(success)  -- Should fail because {} is not exactly true
end

function testAssertTrueWithFunction()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, function() end)
    lu.assertFalse(success)  -- Should fail because function is not exactly true
end

function testAssertTrueWithCoroutine()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertTrue, coroutine.create(function() end))
    lu.assertFalse(success)  -- Should fail because coroutine is not exactly true
end

-- =======================================
-- assertFalse with all test values
-- =======================================

function testAssertFalseWithTrue()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, true)
    lu.assertFalse(success)  -- Should fail because true is not exactly false
end

function testAssertFalseWithFalse()
    lu.assertFalse(false)  -- Should pass
end

function testAssertFalseWithOne()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, 1)
    lu.assertFalse(success)  -- Should fail because 1 is not exactly false
end

function testAssertFalseWithZero()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, 0)
    lu.assertFalse(success)  -- Should fail because 0 is not exactly false
end

function testAssertFalseWithHello()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, "hello")
    lu.assertFalse(success)  -- Should fail because "hello" is not exactly false
end

function testAssertFalseWithEmptyString()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, "")
    lu.assertFalse(success)  -- Should fail because "" is not exactly false
end

function testAssertFalseWithNil()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, nil)
    lu.assertFalse(success)  -- Should fail because nil is not exactly false
end

function testAssertFalseWithTable()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, {})
    lu.assertFalse(success)  -- Should fail because {} is not exactly false
end

function testAssertFalseWithFunction()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, function() end)
    lu.assertFalse(success)  -- Should fail because function is not exactly false
end

function testAssertFalseWithCoroutine()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertFalse, coroutine.create(function() end))
    lu.assertFalse(success)  -- Should fail because coroutine is not exactly false
end

-- =======================================
-- assertNotTrue with all test values
-- =======================================

function testAssertNotTrueWithTrue()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotTrue, true)
    lu.assertFalse(success)  -- Should fail because true is exactly true
end

function testAssertNotTrueWithFalse()
    lu.assertNotTrue(false)  -- Should pass
end

function testAssertNotTrueWithOne()
    lu.assertNotTrue(1)  -- Should pass
end

function testAssertNotTrueWithZero()
    lu.assertNotTrue(0)  -- Should pass
end

function testAssertNotTrueWithHello()
    lu.assertNotTrue("hello")  -- Should pass
end

function testAssertNotTrueWithEmptyString()
    lu.assertNotTrue("")  -- Should pass
end

function testAssertNotTrueWithNil()
    lu.assertNotTrue(nil)  -- Should pass
end

function testAssertNotTrueWithTable()
    lu.assertNotTrue({})  -- Should pass
end

function testAssertNotTrueWithFunction()
    lu.assertNotTrue(function() end)  -- Should pass
end

function testAssertNotTrueWithCoroutine()
    lu.assertNotTrue(coroutine.create(function() end))  -- Should pass
end

-- =======================================
-- assertNotFalse with all test values
-- =======================================

function testAssertNotFalseWithTrue()
    lu.assertNotFalse(true)  -- Should pass
end

function testAssertNotFalseWithFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotFalse, false)
    lu.assertFalse(success)  -- Should fail because false is exactly false
end

function testAssertNotFalseWithOne()
    lu.assertNotFalse(1)  -- Should pass
end

function testAssertNotFalseWithZero()
    lu.assertNotFalse(0)  -- Should pass
end

function testAssertNotFalseWithHello()
    lu.assertNotFalse("hello")  -- Should pass
end

function testAssertNotFalseWithEmptyString()
    lu.assertNotFalse("")  -- Should pass
end

function testAssertNotFalseWithNil()
    lu.assertNotFalse(nil)  -- Should pass
end

function testAssertNotFalseWithTable()
    lu.assertNotFalse({})  -- Should pass
end

function testAssertNotFalseWithFunction()
    lu.assertNotFalse(function() end)  -- Should pass
end

function testAssertNotFalseWithCoroutine()
    lu.assertNotFalse(coroutine.create(function() end))  -- Should pass
end

-- =======================================
-- assertNil with all test values
-- =======================================

function testAssertNilWithTrue()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, true)
    lu.assertFalse(success)  -- Should fail because true is not nil
end

function testAssertNilWithFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, false)
    lu.assertFalse(success)  -- Should fail because false is not nil
end

function testAssertNilWithOne()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, 1)
    lu.assertFalse(success)  -- Should fail because 1 is not nil
end

function testAssertNilWithZero()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, 0)
    lu.assertFalse(success)  -- Should fail because 0 is not nil
end

function testAssertNilWithHello()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, "hello")
    lu.assertFalse(success)  -- Should fail because "hello" is not nil
end

function testAssertNilWithEmptyString()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, "")
    lu.assertFalse(success)  -- Should fail because "" is not nil
end

function testAssertNilWithNil()
    lu.assertNil(nil)  -- Should pass
end

function testAssertNilWithTable()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, {})
    lu.assertFalse(success)  -- Should fail because {} is not nil
end

function testAssertNilWithFunction()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, function() end)
    lu.assertFalse(success)  -- Should fail because function is not nil
end

function testAssertNilWithCoroutine()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNil, coroutine.create(function() end))
    lu.assertFalse(success)  -- Should fail because coroutine is not nil
end

-- =======================================
-- assertNotNil with all test values
-- =======================================

function testAssertNotNilWithTrue()
    lu.assertNotNil(true)  -- Should pass
end

function testAssertNotNilWithFalse()
    lu.assertNotNil(false)  -- Should pass
end

function testAssertNotNilWithOne()
    lu.assertNotNil(1)  -- Should pass
end

function testAssertNotNilWithZero()
    lu.assertNotNil(0)  -- Should pass
end

function testAssertNotNilWithHello()
    lu.assertNotNil("hello")  -- Should pass
end

function testAssertNotNilWithEmptyString()
    lu.assertNotNil("")  -- Should pass
end

function testAssertNotNilWithNil()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotNil, nil)
    lu.assertFalse(success)  -- Should fail because nil is nil
end

function testAssertNotNilWithTable()
    lu.assertNotNil({})  -- Should pass
end

function testAssertNotNilWithFunction()
    lu.assertNotNil(function() end)  -- Should pass
end

function testAssertNotNilWithCoroutine()
    lu.assertNotNil(coroutine.create(function() end))  -- Should pass
end

-- =======================================
-- Test values for assertIs and assertNotIs
-- =======================================

-- Numbers
local num1 = 42
local num2 = 42
local num3 = num1  -- Same reference as num1

-- Tables
local table1 = {1, 2, 3}
local table2 = {1, 2, 3}  -- Same content, different reference
local table3 = table1     -- Same reference as table1

-- Booleans
local bool1 = true
local bool2 = true
local bool3 = false
local bool4 = false

-- Functions
local func1 = function() return "hello" end
local func2 = function() return "hello" end  -- Same behavior, different reference
local func3 = func1  -- Same reference as func1

-- Nil values
local nil1 = nil
local nil2 = nil

-- Threads (coroutines)
local thread1 = coroutine.create(function() print("thread1") end)
local thread2 = coroutine.create(function() print("thread2") end)
local thread3 = thread1  -- Same reference as thread1

-- Strings
local str1 = "hello"
local str2 = "hello"
local str3 = "world"
local str4 = str1  -- Same reference as str1

-- =======================================
-- assertIs with different value combinations
-- =======================================

-- Number comparisons
function testAssertIsWithSameNumbers()
    lu.assertIs(num1, num2)  -- Same value, should pass (numbers with same value are identical)
end

function testAssertIsWithSameNumberReference()
    lu.assertIs(num1, num3)  -- Same reference, should pass
end

function testAssertIsWithDifferentNumbers()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, 42, 24)
    lu.assertFalse(success)  -- Should fail because different values are not identical
end

-- Table comparisons
function testAssertIsWithSameTableReference()
    lu.assertIs(table1, table3)  -- Same reference, should pass
end

function testAssertIsWithDifferentTables()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, table1, table2)
    lu.assertFalse(success)  -- Should fail because different references are not identical
end

function testAssertIsWithEmptyTables()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, {}, {})
    lu.assertFalse(success)  -- Should fail because different empty tables are not identical
end

-- Boolean comparisons
function testAssertIsWithSameBooleanTrue()
    lu.assertIs(bool1, bool2)  -- Both true, should pass
end

function testAssertIsWithSameBooleanFalse()
    lu.assertIs(bool3, bool4)  -- Both false, should pass
end

function testAssertIsWithDifferentBooleans()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, bool1, bool3)
    lu.assertFalse(success)  -- Should fail because true and false are not identical
end

function testAssertIsWithLiteralBooleans()
    lu.assertIs(true, true)  -- Literal booleans, should pass
end

-- Function comparisons
function testAssertIsWithSameFunctionReference()
    lu.assertIs(func1, func3)  -- Same reference, should pass
end

function testAssertIsWithDifferentFunctions()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, func1, func2)
    lu.assertFalse(success)  -- Should fail because different function references are not identical
end

function testAssertIsWithAnonymousFunctions()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, function() end, function() end)
    lu.assertFalse(success)  -- Should fail because different anonymous functions are not identical
end

-- Nil comparisons
function testAssertIsWithNilValues()
    lu.assertIs(nil1, nil2)  -- Both nil, should pass
end

function testAssertIsWithLiteralNils()
    lu.assertIs(nil, nil)  -- Literal nils, should pass
end

-- Thread comparisons
function testAssertIsWithSameThreadReference()
    lu.assertIs(thread1, thread3)  -- Same reference, should pass
end

function testAssertIsWithDifferentThreads()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, thread1, thread2)
    lu.assertFalse(success)  -- Should fail because different threads are not identical
end

-- String comparisons
function testAssertIsWithSameStrings()
    lu.assertIs(str1, str2)  -- Same content, should pass due to string interning
end

function testAssertIsWithSameStringReference()
    lu.assertIs(str1, str4)  -- Same reference, should pass
end

function testAssertIsWithDifferentStrings()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, str1, str3)
    lu.assertFalse(success)  -- Should fail because different content strings are not identical
end

function testAssertIsWithLiteralStrings()
    lu.assertIs("test", "test")  -- Same literal strings, should pass due to interning
end

-- Mixed type comparisons
function testAssertIsWithNilAndFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, nil, false)
    lu.assertFalse(success)  -- Should fail because nil and false are different types
end

function testAssertIsWithZeroAndFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, 0, false)
    lu.assertFalse(success)  -- Should fail because 0 and false are different types
end

function testAssertIsWithEmptyStringAndNil()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertIs, "", nil)
    lu.assertFalse(success)  -- Should fail because empty string and nil are different types
end

-- =======================================
-- assertNotIs with different value combinations
-- =======================================

-- Number comparisons
function testAssertNotIsWithDifferentNumbers()
    lu.assertNotIs(42, 24)  -- Different values, should pass
end

function testAssertNotIsWithSameNumbers()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, num1, num2)
    lu.assertFalse(success)  -- Should fail because numbers with same value are identical
end

function testAssertNotIsWithSameNumberReference()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, num1, num3)
    lu.assertFalse(success)  -- Should fail because same reference is identical
end

-- Table comparisons
function testAssertNotIsWithDifferentTables()
    lu.assertNotIs(table1, table2)  -- Different references, should pass
end

function testAssertNotIsWithSameTableReference()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, table1, table3)
    lu.assertFalse(success)  -- Should fail because same reference is identical
end

function testAssertNotIsWithEmptyTables()
    lu.assertNotIs({}, {})  -- Different empty tables, should pass
end

-- Boolean comparisons
function testAssertNotIsWithDifferentBooleans()
    lu.assertNotIs(bool1, bool3)  -- true vs false, should pass
end

function testAssertNotIsWithSameBooleanTrue()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, bool1, bool2)
    lu.assertFalse(success)  -- Should fail because both true values are identical
end

function testAssertNotIsWithSameBooleanFalse()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, bool3, bool4)
    lu.assertFalse(success)  -- Should fail because both false values are identical
end

-- Function comparisons
function testAssertNotIsWithDifferentFunctions()
    lu.assertNotIs(func1, func2)  -- Different references, should pass
end

function testAssertNotIsWithSameFunctionReference()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, func1, func3)
    lu.assertFalse(success)  -- Should fail because same reference is identical
end

function testAssertNotIsWithAnonymousFunctions()
    lu.assertNotIs(function() end, function() end)  -- Different functions, should pass
end

-- Nil comparisons
function testAssertNotIsWithNilValues()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, nil1, nil2)
    lu.assertFalse(success)  -- Should fail because both nil values are identical
end

function testAssertNotIsWithLiteralNils()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, nil, nil)
    lu.assertFalse(success)  -- Should fail because literal nils are identical
end

-- Thread comparisons
function testAssertNotIsWithDifferentThreads()
    lu.assertNotIs(thread1, thread2)  -- Different threads, should pass
end

function testAssertNotIsWithSameThreadReference()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, thread1, thread3)
    lu.assertFalse(success)  -- Should fail because same reference is identical
end

-- String comparisons
function testAssertNotIsWithDifferentStrings()
    lu.assertNotIs(str1, str3)  -- Different content, should pass
end

function testAssertNotIsWithSameStrings()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, str1, str2)
    lu.assertFalse(success)  -- Should fail because same content strings are identical due to interning
end

function testAssertNotIsWithSameStringReference()
    -- Should fail - use pcall to catch the error
    local success, err = pcall(lu.assertNotIs, str1, str4)
    lu.assertFalse(success)  -- Should fail because same reference is identical
end

-- Mixed type comparisons
function testAssertNotIsWithNilAndFalse()
    lu.assertNotIs(nil, false)  -- Different types, should pass
end

function testAssertNotIsWithZeroAndFalse()
    lu.assertNotIs(0, false)  -- Different types, should pass
end

function testAssertNotIsWithEmptyStringAndNil()
    lu.assertNotIs("", nil)  -- Different types, should pass
end

function testAssertNotIsWithNumberAndString()
    lu.assertNotIs(42, "42")  -- Different types, should pass
end

function testAssertNotIsWithTableAndString()
    lu.assertNotIs({1, 2}, "1,2")  -- Different types, should pass
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
