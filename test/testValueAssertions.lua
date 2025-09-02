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
    lu.assertEvalToTrue(false)  -- Should fail
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
    lu.assertEvalToTrue(nil)  -- Should fail
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
    lu.assertEvalToFalse(true)  -- Should fail
end

function testAssertEvalToFalseWithFalse()
    lu.assertEvalToFalse(false)  -- Should pass
end

function testAssertEvalToFalseWithOne()
    lu.assertEvalToFalse(1)  -- Should fail
end

function testAssertEvalToFalseWithZero()
    lu.assertEvalToFalse(0)  -- Should fail
end

function testAssertEvalToFalseWithHello()
    lu.assertEvalToFalse("hello")  -- Should fail
end

function testAssertEvalToFalseWithEmptyString()
    lu.assertEvalToFalse("")  -- Should fail
end

function testAssertEvalToFalseWithNil()
    lu.assertEvalToFalse(nil)  -- Should pass
end

function testAssertEvalToFalseWithTable()
    lu.assertEvalToFalse({})  -- Should fail
end

function testAssertEvalToFalseWithFunction()
    lu.assertEvalToFalse(function() end)  -- Should fail
end

function testAssertEvalToFalseWithCoroutine()
    lu.assertEvalToFalse(coroutine.create(function() end))  -- Should fail
end

-- =======================================
-- assertTrue with all test values
-- =======================================

function testAssertTrueWithTrue()
    lu.assertTrue(true)  -- Should pass
end

function testAssertTrueWithFalse()
    lu.assertTrue(false)  -- Should fail
end

function testAssertTrueWithOne()
    lu.assertTrue(1)  -- Should fail
end

function testAssertTrueWithZero()
    lu.assertTrue(0)  -- Should fail
end

function testAssertTrueWithHello()
    lu.assertTrue("hello")  -- Should fail
end

function testAssertTrueWithEmptyString()
    lu.assertTrue("")  -- Should fail
end

function testAssertTrueWithNil()
    lu.assertTrue(nil)  -- Should fail
end

function testAssertTrueWithTable()
    lu.assertTrue({})  -- Should fail
end

function testAssertTrueWithFunction()
    lu.assertTrue(function() end)  -- Should fail
end

function testAssertTrueWithCoroutine()
    lu.assertTrue(coroutine.create(function() end))  -- Should fail
end

-- =======================================
-- assertFalse with all test values
-- =======================================

function testAssertFalseWithTrue()
    lu.assertFalse(true)  -- Should fail
end

function testAssertFalseWithFalse()
    lu.assertFalse(false)  -- Should pass
end

function testAssertFalseWithOne()
    lu.assertFalse(1)  -- Should fail
end

function testAssertFalseWithZero()
    lu.assertFalse(0)  -- Should fail
end

function testAssertFalseWithHello()
    lu.assertFalse("hello")  -- Should fail
end

function testAssertFalseWithEmptyString()
    lu.assertFalse("")  -- Should fail
end

function testAssertFalseWithNil()
    lu.assertFalse(nil)  -- Should fail
end

function testAssertFalseWithTable()
    lu.assertFalse({})  -- Should fail
end

function testAssertFalseWithFunction()
    lu.assertFalse(function() end)  -- Should fail
end

function testAssertFalseWithCoroutine()
    lu.assertFalse(coroutine.create(function() end))  -- Should fail
end

-- =======================================
-- assertNotTrue with all test values
-- =======================================

function testAssertNotTrueWithTrue()
    lu.assertNotTrue(true)  -- Should fail
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
    lu.assertNotFalse(false)  -- Should fail
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
    lu.assertNil(true)  -- Should fail
end

function testAssertNilWithFalse()
    lu.assertNil(false)  -- Should fail
end

function testAssertNilWithOne()
    lu.assertNil(1)  -- Should fail
end

function testAssertNilWithZero()
    lu.assertNil(0)  -- Should fail
end

function testAssertNilWithHello()
    lu.assertNil("hello")  -- Should fail
end

function testAssertNilWithEmptyString()
    lu.assertNil("")  -- Should fail
end

function testAssertNilWithNil()
    lu.assertNil(nil)  -- Should pass
end

function testAssertNilWithTable()
    lu.assertNil({})  -- Should fail
end

function testAssertNilWithFunction()
    lu.assertNil(function() end)  -- Should fail
end

function testAssertNilWithCoroutine()
    lu.assertNil(coroutine.create(function() end))  -- Should fail
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
    lu.assertNotNil(nil)  -- Should fail
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
    lu.assertIs(42, 24)  -- Different values, should fail
end

-- Table comparisons
function testAssertIsWithSameTableReference()
    lu.assertIs(table1, table3)  -- Same reference, should pass
end

function testAssertIsWithDifferentTables()
    lu.assertIs(table1, table2)  -- Different references, should fail
end

function testAssertIsWithEmptyTables()
    lu.assertIs({}, {})  -- Different empty tables, should fail
end

-- Boolean comparisons
function testAssertIsWithSameBooleanTrue()
    lu.assertIs(bool1, bool2)  -- Both true, should pass
end

function testAssertIsWithSameBooleanFalse()
    lu.assertIs(bool3, bool4)  -- Both false, should pass
end

function testAssertIsWithDifferentBooleans()
    lu.assertIs(bool1, bool3)  -- true vs false, should fail
end

function testAssertIsWithLiteralBooleans()
    lu.assertIs(true, true)  -- Literal booleans, should pass
end

-- Function comparisons
function testAssertIsWithSameFunctionReference()
    lu.assertIs(func1, func3)  -- Same reference, should pass
end

function testAssertIsWithDifferentFunctions()
    lu.assertIs(func1, func2)  -- Different references, should fail
end

function testAssertIsWithAnonymousFunctions()
    lu.assertIs(function() end, function() end)  -- Different anonymous functions, should fail
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
    lu.assertIs(thread1, thread2)  -- Different threads, should fail
end

-- String comparisons
function testAssertIsWithSameStrings()
    lu.assertIs(str1, str2)  -- Same content, should pass due to string interning
end

function testAssertIsWithSameStringReference()
    lu.assertIs(str1, str4)  -- Same reference, should pass
end

function testAssertIsWithDifferentStrings()
    lu.assertIs(str1, str3)  -- Different content, should fail
end

function testAssertIsWithLiteralStrings()
    lu.assertIs("test", "test")  -- Same literal strings, should pass due to interning
end

-- Mixed type comparisons
function testAssertIsWithNilAndFalse()
    lu.assertIs(nil, false)  -- Different types, should fail
end

function testAssertIsWithZeroAndFalse()
    lu.assertIs(0, false)  -- Different types, should fail
end

function testAssertIsWithEmptyStringAndNil()
    lu.assertIs("", nil)  -- Different types, should fail
end

-- =======================================
-- assertNotIs with different value combinations
-- =======================================

-- Number comparisons
function testAssertNotIsWithDifferentNumbers()
    lu.assertNotIs(42, 24)  -- Different values, should pass
end

function testAssertNotIsWithSameNumbers()
    lu.assertNotIs(num1, num2)  -- Same value, should fail (numbers with same value are identical)
end

function testAssertNotIsWithSameNumberReference()
    lu.assertNotIs(num1, num3)  -- Same reference, should fail
end

-- Table comparisons
function testAssertNotIsWithDifferentTables()
    lu.assertNotIs(table1, table2)  -- Different references, should pass
end

function testAssertNotIsWithSameTableReference()
    lu.assertNotIs(table1, table3)  -- Same reference, should fail
end

function testAssertNotIsWithEmptyTables()
    lu.assertNotIs({}, {})  -- Different empty tables, should pass
end

-- Boolean comparisons
function testAssertNotIsWithDifferentBooleans()
    lu.assertNotIs(bool1, bool3)  -- true vs false, should pass
end

function testAssertNotIsWithSameBooleanTrue()
    lu.assertNotIs(bool1, bool2)  -- Both true, should fail
end

function testAssertNotIsWithSameBooleanFalse()
    lu.assertNotIs(bool3, bool4)  -- Both false, should fail
end

-- Function comparisons
function testAssertNotIsWithDifferentFunctions()
    lu.assertNotIs(func1, func2)  -- Different references, should pass
end

function testAssertNotIsWithSameFunctionReference()
    lu.assertNotIs(func1, func3)  -- Same reference, should fail
end

function testAssertNotIsWithAnonymousFunctions()
    lu.assertNotIs(function() end, function() end)  -- Different functions, should pass
end

-- Nil comparisons
function testAssertNotIsWithNilValues()
    lu.assertNotIs(nil1, nil2)  -- Both nil, should fail
end

function testAssertNotIsWithLiteralNils()
    lu.assertNotIs(nil, nil)  -- Literal nils, should fail
end

-- Thread comparisons
function testAssertNotIsWithDifferentThreads()
    lu.assertNotIs(thread1, thread2)  -- Different threads, should pass
end

function testAssertNotIsWithSameThreadReference()
    lu.assertNotIs(thread1, thread3)  -- Same reference, should fail
end

-- String comparisons
function testAssertNotIsWithDifferentStrings()
    lu.assertNotIs(str1, str3)  -- Different content, should pass
end

function testAssertNotIsWithSameStrings()
    lu.assertNotIs(str1, str2)  -- Same content, should fail due to string interning
end

function testAssertNotIsWithSameStringReference()
    lu.assertNotIs(str1, str4)  -- Same reference, should fail
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
