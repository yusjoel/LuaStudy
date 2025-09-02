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

-- Run the tests
os.exit( lu.LuaUnit.run() )
