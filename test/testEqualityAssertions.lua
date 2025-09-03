-- Demonstration of Equality Assertions in LuaUnit
-- Equality assertion functions: assertEquals, assertNotEquals, assertAlmostEquals, assertNotAlmostEquals
-- Run with: lua testEqualityAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- Test data - various data types and values
-- =======================================

-- Numbers - exact values
local int1 = 42
local int2 = 42
local int3 = 43
local float1 = 3.14159
local float2 = 3.14159
local float3 = 3.14160
local zero1 = 0
local zero2 = 0.0
local negative1 = -100
local negative2 = -100

-- Numbers - for approximate comparison
local approx1 = 1.0
local approx2 = 1.0000001
local approx3 = 0.9999999
local approx4 = 1.1
local pi1 = 3.141592653589793
local pi2 = 3.141592653589794
local small1 = 1.23456789e-10
local small2 = 1.23456790e-10
local large1 = 1.23456789e10
local large2 = 1.23456790e10

-- Strings
local str1 = "hello"
local str2 = "hello"
local str3 = "Hello"
local str4 = "world"
local emptyStr1 = ""
local emptyStr2 = ""

-- Booleans
local bool1 = true
local bool2 = true
local bool3 = false
local bool4 = false

-- Tables
local table1 = {1, 2, 3}
local table2 = {1, 2, 3}
local table3 = {1, 2, 4}
local emptyTable1 = {}
local emptyTable2 = {}
local hashTable1 = {name = "John", age = 30}
local hashTable2 = {name = "John", age = 30}

-- Functions
local function func1() return 42 end
local function func2() return 42 end
local func3 = func1  -- Same reference

-- Special values
local nilValue1 = nil
local nilValue2 = nil
local nanValue1 = 0/0
local nanValue2 = 0/0
local infValue1 = math.huge
local infValue2 = math.huge

-- Mixed types for inequality testing
local mixedValues = {
    42,
    "42",
    true,
    {42},
    function() return 42 end
}

-- =======================================
-- assertEquals tests
-- =======================================

function testAssertEqualsWithIdenticalIntegers()
    lu.assertEquals(int1, int2)  -- Should pass: 42 == 42
end

function testAssertEqualsWithIdenticalFloats()
    lu.assertEquals(float1, float2)  -- Should pass: 3.14159 == 3.14159
end

function testAssertEqualsWithZeroTypes()
    lu.assertEquals(zero1, zero2)  -- Should pass: 0 == 0.0
end

function testAssertEqualsWithNegativeNumbers()
    lu.assertEquals(negative1, negative2)  -- Should pass: -100 == -100
end

function testAssertEqualsWithIdenticalStrings()
    lu.assertEquals(str1, str2)  -- Should pass: "hello" == "hello"
end

function testAssertEqualsWithEmptyStrings()
    lu.assertEquals(emptyStr1, emptyStr2)  -- Should pass: "" == ""
end

function testAssertEqualsWithIdenticalBooleans()
    lu.assertEquals(bool1, bool2)  -- Should pass: true == true
end

function testAssertEqualsWithFalseBooleans()
    lu.assertEquals(bool3, bool4)  -- Should pass: false == false
end

function testAssertEqualsWithNilValues()
    lu.assertEquals(nilValue1, nilValue2)  -- Should pass: nil == nil
end

function testAssertEqualsWithInfinityValues()
    lu.assertEquals(infValue1, infValue2)  -- Should pass: math.huge == math.huge
end

function testAssertEqualsWithSameTableReference()
    lu.assertEquals(table1, table1)  -- Should pass: same table reference
end

function testAssertEqualsWithSameFunctionReference()
    lu.assertEquals(func1, func3)  -- Should pass: same function reference
end

function testAssertEqualsWithDifferentIntegers()
    -- Should fail: 42 != 43 - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, int1, int3)
    lu.assertFalse(success)  -- Should fail due to inequality
end

function testAssertEqualsWithDifferentFloats()
    -- Should fail: 3.14159 != 3.14160 - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, float1, float3)
    lu.assertFalse(success)  -- Should fail due to inequality
end

function testAssertEqualsWithDifferentStrings()
    -- Should fail: "hello" != "Hello" - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, str1, str3)
    lu.assertFalse(success)  -- Should fail due to inequality
end

function testAssertEqualsWithDifferentBooleans()
    -- Should fail: true != false - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, bool1, bool3)
    lu.assertFalse(success)  -- Should fail due to inequality
end

function testAssertEqualsWithDifferentTables()
    lu.assertEquals(table1, table2)  -- Should pass: different table objects but same content {1,2,3}
end

function testAssertEqualsWithDifferentTableContent()
    -- Should fail: different content {1,2,3} vs {1,2,4} - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, table1, table3)
    lu.assertFalse(success)  -- Should fail due to different table content
end

function testAssertEqualsWithEmptyTables()
    lu.assertEquals(emptyTable1, emptyTable2)  -- Should pass: both empty tables
end

function testAssertEqualsWithHashTables()
    lu.assertEquals(hashTable1, hashTable2)  -- Should pass: same key-value pairs
end

function testAssertEqualsWithDifferentFunctions()
    -- Should fail: different function objects - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, func1, func2)
    lu.assertFalse(success)  -- Should fail due to different functions
end

function testAssertEqualsWithNaNValues()
    -- Should fail: NaN != NaN (special property) - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, nanValue1, nanValue2)
    lu.assertFalse(success)  -- Should fail due to NaN inequality
end

function testAssertEqualsWithMixedTypes()
    -- Should fail: 42 != "42" - use pcall to catch the error
    local success, err = pcall(lu.assertEquals, mixedValues[1], mixedValues[2])
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertNotEquals tests
-- =======================================

function testAssertNotEqualsWithDifferentIntegers()
    lu.assertNotEquals(int1, int3)  -- Should pass: 42 != 43
end

function testAssertNotEqualsWithDifferentFloats()
    lu.assertNotEquals(float1, float3)  -- Should pass: 3.14159 != 3.14160
end

function testAssertNotEqualsWithDifferentStrings()
    lu.assertNotEquals(str1, str3)  -- Should pass: "hello" != "Hello"
end

function testAssertNotEqualsWithStringAndNumber()
    lu.assertNotEquals(str1, int1)  -- Should pass: "hello" != 42
end

function testAssertNotEqualsWithDifferentBooleans()
    lu.assertNotEquals(bool1, bool3)  -- Should pass: true != false
end

function testAssertNotEqualsWithDifferentTables()
    lu.assertNotEquals(table1, table3)  -- Should pass: different content {1,2,3} vs {1,2,4}
end

function testAssertNotEqualsWithSameContentTables()
    -- Should fail: same content {1,2,3} - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, table1, table2)
    lu.assertFalse(success)  -- Should fail due to same table content
end

function testAssertNotEqualsWithEmptyTables()
    -- Should fail: both empty tables - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, emptyTable1, emptyTable2)
    lu.assertFalse(success)  -- Should fail due to same empty table content
end

function testAssertNotEqualsWithHashTables()
    -- Should fail: same key-value pairs - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, hashTable1, hashTable2)
    lu.assertFalse(success)  -- Should fail due to same hash table content
end

function testAssertNotEqualsWithDifferentFunctions()
    lu.assertNotEquals(func1, func2)  -- Should pass: different function objects
end

function testAssertNotEqualsWithNaNValues()
    lu.assertNotEquals(nanValue1, nanValue2)  -- Should pass: NaN != NaN
end

function testAssertNotEqualsWithMixedTypes()
    lu.assertNotEquals(mixedValues[1], mixedValues[2])  -- Should pass: 42 != "42"
end

function testAssertNotEqualsWithBooleanAndNumber()
    lu.assertNotEquals(bool1, int1)  -- Should pass: true != 42
end

function testAssertNotEqualsWithNilAndZero()
    lu.assertNotEquals(nilValue1, zero1)  -- Should pass: nil != 0
end

function testAssertNotEqualsWithEmptyTableAndNil()
    lu.assertNotEquals(emptyTable1, nilValue1)  -- Should pass: {} != nil
end

function testAssertNotEqualsWithIdenticalIntegers()
    -- Should fail: 42 == 42 - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, int1, int2)
    lu.assertFalse(success)  -- Should fail due to equality
end

function testAssertNotEqualsWithIdenticalStrings()
    -- Should fail: "hello" == "hello" - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, str1, str2)
    lu.assertFalse(success)  -- Should fail due to equality
end

function testAssertNotEqualsWithIdenticalBooleans()
    -- Should fail: true == true - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, bool1, bool2)
    lu.assertFalse(success)  -- Should fail due to equality
end

function testAssertNotEqualsWithNilValues()
    -- Should fail: nil == nil - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, nilValue1, nilValue2)
    lu.assertFalse(success)  -- Should fail due to equality
end

function testAssertNotEqualsWithSameReference()
    -- Should fail: same table reference - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, table1, table1)
    lu.assertFalse(success)  -- Should fail due to same reference
end

function testAssertNotEqualsWithZeroTypes()
    -- Should fail: 0 == 0.0 - use pcall to catch the error
    local success, err = pcall(lu.assertNotEquals, zero1, zero2)
    lu.assertFalse(success)  -- Should fail due to equality
end

-- =======================================
-- assertAlmostEquals tests
-- =======================================

function testAssertAlmostEqualsWithExactMatch()
    lu.assertAlmostEquals(approx1, approx1, 1e-7)  -- Should pass: 1.0 ~= 1.0 (exact)
end

function testAssertAlmostEqualsWithSmallDifference()
    lu.assertAlmostEquals(approx1, approx2, 1e-6)  -- Should pass: 1.0 ~= 1.0000001 (within tolerance)
end

function testAssertAlmostEqualsWithSlightlyNegative()
    lu.assertAlmostEquals(approx1, approx3, 1e-6)  -- Should pass: 1.0 ~= 0.9999999 (within tolerance)
end

function testAssertAlmostEqualsWithPiPrecision()
    lu.assertAlmostEquals(pi1, pi2, 1e-14)  -- Should pass: close pi values
end

function testAssertAlmostEqualsWithSmallNumbers()
    lu.assertAlmostEquals(small1, small2, 1e-15)  -- Should pass: small numbers with tiny difference (1e-10 level)
end

function testAssertAlmostEqualsWithLargeNumbers()
    lu.assertAlmostEquals(large1, large2, 1e5)  -- Should pass: large numbers with small relative difference
end

function testAssertAlmostEqualsWithZeroValues()
    lu.assertAlmostEquals(0.0, 0.0000001, 1e-6)  -- Should pass: near zero values
end

function testAssertAlmostEqualsWithNegativeValues()
    lu.assertAlmostEquals(-1.0, -1.0000001, 1e-6)  -- Should pass: negative values within tolerance
end

function testAssertAlmostEqualsWithCustomTolerance()
    lu.assertAlmostEquals(1.0, 1.1, 0.2)  -- Should pass: with custom tolerance of 0.2
end

function testAssertAlmostEqualsWithTightTolerance()
    -- Should fail: difference 0.01 > tolerance 0.005 - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, 1.0, 1.01, 0.005)
    lu.assertFalse(success)  -- Should fail due to difference exceeding tolerance
end

function testAssertAlmostEqualsWithLargeDifference()
    -- Should fail: 1.0 vs 1.1 (too large difference) - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, approx1, approx4, 1e-6)
    lu.assertFalse(success)  -- Should fail due to large difference
end

function testAssertAlmostEqualsWithVeryDifferentNumbers()
    -- Should fail: very different numbers - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, 1.0, 10.0, 1e-6)
    lu.assertFalse(success)  -- Should fail due to very different numbers
end

function testAssertAlmostEqualsWithInfinity()
    -- Should fail: math.huge - math.huge = NaN in Lua, NaN != 0 - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, math.huge, math.huge, 1e-6)
    lu.assertFalse(success)  -- Should fail due to NaN comparison
end

function testAssertAlmostEqualsWithNaN()
    -- Should fail: NaN != NaN - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, 0/0, 0/0, 1e-6)
    lu.assertFalse(success)  -- Should fail due to NaN inequality
end

function testAssertAlmostEqualsWithMixedInfinity()
    -- Should fail: +inf != -inf - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, math.huge, -math.huge, 1e-6)
    lu.assertFalse(success)  -- Should fail due to different infinities
end

function testAssertAlmostEqualsWithStringNumbers()
    -- Should fail: strings, not numbers - use pcall to catch the error
    local success, err = pcall(lu.assertAlmostEquals, "1.0", "1.0000001", 1e-6)
    lu.assertFalse(success)  -- Should fail due to type error
end

-- =======================================
-- assertNotAlmostEquals tests
-- =======================================

function testAssertNotAlmostEqualsWithLargeDifference()
    lu.assertNotAlmostEquals(approx1, approx4, 1e-6)  -- Should pass: 1.0 vs 1.1 (large difference)
end

function testAssertNotAlmostEqualsWithVeryDifferentNumbers()
    lu.assertNotAlmostEquals(1.0, 10.0, 1e-6)  -- Should pass: very different numbers
end

function testAssertNotAlmostEqualsWithMixedInfinity()
    lu.assertNotAlmostEquals(math.huge, -math.huge, 1e-6)  -- Should pass: +inf != -inf
end

function testAssertNotAlmostEqualsWithNumberAndString()
    -- Should pass: different types - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, 1.0, "1.0", 1e-6)
    lu.assertFalse(success)  -- Should fail due to type error
end

function testAssertNotAlmostEqualsWithCustomTolerance()
    lu.assertNotAlmostEquals(1.0, 1.1, 0.05)  -- Should pass: difference 0.1 > tolerance 0.05
end

function testAssertNotAlmostEqualsWithZeroAndLarge()
    lu.assertNotAlmostEquals(0.0, 1.0, 1e-6)  -- Should pass: significantly different
end

function testAssertNotAlmostEqualsWithNegativeAndPositive()
    lu.assertNotAlmostEquals(-10.0, 10.0, 1e-6)  -- Should pass: opposite signs, large difference
end

function testAssertNotAlmostEqualsWithBooleans()
    -- Should pass: booleans are not numbers - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, true, false, 1e-6)
    lu.assertFalse(success)  -- Should fail due to type error
end

function testAssertNotAlmostEqualsWithNil()
    -- Should pass: number vs nil - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, 1.0, nil, 1e-6)
    lu.assertFalse(success)  -- Should fail due to type error
end

function testAssertNotAlmostEqualsWithTable()
    -- Should pass: number vs table - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, 1.0, {1.0}, 1e-6)
    lu.assertFalse(success)  -- Should fail due to type error
end

function testAssertNotAlmostEqualsWithExactMatch()
    -- Should fail: exact match - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, approx1, approx1, 1e-6)
    lu.assertFalse(success)  -- Should fail due to exact match
end

function testAssertNotAlmostEqualsWithSmallDifference()
    -- Should fail: within tolerance - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, approx1, approx2, 1e-6)
    lu.assertFalse(success)  -- Should fail due to values within tolerance
end

function testAssertNotAlmostEqualsWithTinyDifference()
    -- Should fail: very small difference within tolerance - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, 1.0, 1.0000001, 1e-6)
    lu.assertFalse(success)  -- Should fail due to tiny difference within tolerance
end

function testAssertNotAlmostEqualsWithZeroValues()
    -- Should fail: near zero, within tolerance - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, 0.0, 0.0000001, 1e-6)
    lu.assertFalse(success)  -- Should fail due to values within tolerance
end

function testAssertNotAlmostEqualsWithInfinity()
    lu.assertNotAlmostEquals(math.huge, math.huge, 1e-6)  -- Should pass: math.huge - math.huge = NaN, NaN != 0
end

function testAssertNotAlmostEqualsWithCustomToleranceMatch()
    -- Should fail: within custom tolerance 0.1 - use pcall to catch the error
    local success, err = pcall(lu.assertNotAlmostEquals, 1.0, 1.05, 0.1)
    lu.assertFalse(success)  -- Should fail due to values within custom tolerance
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
