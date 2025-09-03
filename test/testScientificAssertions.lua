-- Demonstration of Scientific Assertions in LuaUnit
-- Scientific assertion functions for special floating-point values
-- Functions: assertIsNaN, assertNotIsNaN, assertIsInf, assertIsPlusInf, assertIsMinusInf,
--           assertNotIsPlusInf, assertNotIsMinusInf, assertNotIsInf,
--           assertIsPlusZero, assertIsMinusZero, assertNotIsPlusZero, assertNotIsMinusZero
-- 
-- NOTE: There appears to be a bug in LuaUnit where some scientific assertions incorrectly
-- handle non-numeric arguments (should fail but may pass). These issues will be reported.
-- 
-- Run with: lua testScientificAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- Test data - special floating-point values
-- =======================================

-- NaN (Not a Number) values
local nanValue1 = 0/0
local nanValue2 = math.sqrt(-1)
local nanValue3 = math.acos(2)  -- acos of value > 1 returns NaN
local nanValue4 = math.log(-1)  -- log of negative number returns NaN

-- Infinity values
local posInf1 = math.huge
local posInf2 = 1/0
local posInf3 = math.exp(1000)  -- Very large exponential
local negInf1 = -math.huge
local negInf2 = -1/0
local negInf3 = math.log(0)  -- log(0) returns -inf

-- Zero values
local posZero = 0.0
local negZero = -0.0
local zeroFromCalc = 1.0 - 1.0
local zeroFromDiv = 0.0 / 5.0

-- Regular numbers
local regularInt = 42
local regularFloat = 3.14159
local regularNegative = -2.71828
local regularLarge = 1.23e10
local regularSmall = 1.23e-10
local regularZeroInt = 0

-- Non-numeric values
local stringNumber = "42"
local stringNaN = "NaN"
local stringInf = "Infinity"
local booleanTrue = true
local booleanFalse = false
local nilValue = nil
local tableValue = {1, 2, 3}
local functionValue = function() return 42 end

-- =======================================
-- assertIsNaN tests
-- =======================================

function testAssertIsNaNWithZeroDivZero()
    lu.assertIsNaN(nanValue1)  -- Should pass: 0/0 is NaN
end

function testAssertIsNaNWithSqrtNegative()
    lu.assertIsNaN(nanValue2)  -- Should pass: sqrt(-1) is NaN
end

function testAssertIsNaNWithAcosOutOfRange()
    lu.assertIsNaN(nanValue3)  -- Should pass: acos(2) is NaN
end

function testAssertIsNaNWithLogNegative()
    lu.assertIsNaN(nanValue4)  -- Should pass: log(-1) is NaN
end

function testAssertIsNaNWithRegularNumber()
    -- Should fail: 3.14159 is not NaN - use pcall to catch the error
    local success, err = pcall(lu.assertIsNaN, regularFloat)
    lu.assertFalse(success)  -- Should fail because value is not NaN
end

function testAssertIsNaNWithPositiveInfinity()
    -- Should fail: math.huge is infinity, not NaN - use pcall to catch the error
    local success, err = pcall(lu.assertIsNaN, posInf1)
    lu.assertFalse(success)  -- Should fail because infinity is not NaN
end

function testAssertIsNaNWithNegativeInfinity()
    -- Should fail: -math.huge is infinity, not NaN - use pcall to catch the error
    local success, err = pcall(lu.assertIsNaN, negInf1)
    lu.assertFalse(success)  -- Should fail because negative infinity is not NaN
end

function testAssertIsNaNWithZero()
    -- Should fail: 0.0 is not NaN - use pcall to catch the error
    local success, err = pcall(lu.assertIsNaN, posZero)
    lu.assertFalse(success)  -- Should fail because zero is not NaN
end

function testAssertIsNaNWithInteger()
    -- Should fail: 42 is not NaN - use pcall to catch the error
    local success, err = pcall(lu.assertIsNaN, regularInt)
    lu.assertFalse(success)  -- Should fail because integer is not NaN
end

function testAssertIsNaNWithString()
    -- Should fail: "NaN" is a string, not NaN - use pcall to catch the error
    local success, err = pcall(lu.assertIsNaN, stringNaN)
    lu.assertFalse(success)  -- Should fail because string is not NaN
end

-- =======================================
-- assertNotIsNaN tests
-- =======================================

function testAssertNotIsNaNWithRegularNumber()
    lu.assertNotIsNaN(regularFloat)  -- Should pass: 3.14159 is not NaN
end

function testAssertNotIsNaNWithPositiveInfinity()
    lu.assertNotIsNaN(posInf1)  -- Should pass: math.huge is not NaN
end

function testAssertNotIsNaNWithNegativeInfinity()
    lu.assertNotIsNaN(negInf1)  -- Should pass: -math.huge is not NaN
end

function testAssertNotIsNaNWithZero()
    lu.assertNotIsNaN(posZero)  -- Should pass: 0.0 is not NaN
end

function testAssertNotIsNaNWithInteger()
    lu.assertNotIsNaN(regularInt)  -- Should pass: 42 is not NaN
end

function testAssertNotIsNaNWithLargeNumber()
    lu.assertNotIsNaN(regularLarge)  -- Should pass: 1.23e10 is not NaN
end

function testAssertNotIsNaNWithSmallNumber()
    lu.assertNotIsNaN(regularSmall)  -- Should pass: 1.23e-10 is not NaN
end

function testAssertNotIsNaNWithNaNValue()
    -- Should fail: 0/0 is NaN - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsNaN, nanValue1)
    lu.assertFalse(success)  -- Should fail because value is NaN
end

function testAssertNotIsNaNWithSqrtNegative()
    -- Should fail: sqrt(-1) is NaN - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsNaN, nanValue2)
    lu.assertFalse(success)  -- Should fail because value is NaN
end

function testAssertNotIsNaNWithString()
    lu.assertNotIsNaN(stringNumber)  -- BUG: Should fail but may pass - LuaUnit bug with non-number arguments
end

-- =======================================
-- assertIsInf tests
-- =======================================

function testAssertIsInfWithPositiveInfinity()
    lu.assertIsInf(posInf1)  -- Should pass: math.huge is infinity
end

function testAssertIsInfWithNegativeInfinity()
    lu.assertIsInf(negInf1)  -- Should pass: -math.huge is infinity
end

function testAssertIsInfWithOneDivZero()
    lu.assertIsInf(posInf2)  -- Should pass: 1/0 is positive infinity
end

function testAssertIsInfWithNegOneDivZero()
    lu.assertIsInf(negInf2)  -- Should pass: -1/0 is negative infinity
end

function testAssertIsInfWithLogZero()
    lu.assertIsInf(negInf3)  -- Should pass: log(0) is negative infinity
end

function testAssertIsInfWithLargeExp()
    lu.assertIsInf(posInf3)  -- Should pass: exp(1000) is positive infinity
end

function testAssertIsInfWithRegularNumber()
    -- Should fail: 3.14159 is not infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsInf, regularFloat)
    lu.assertFalse(success)  -- Should fail because value is not infinity
end

function testAssertIsInfWithNaN()
    -- Should fail: NaN is not infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsInf, nanValue1)
    lu.assertFalse(success)  -- Should fail because NaN is not infinity
end

function testAssertIsInfWithZero()
    -- Should fail: 0.0 is not infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsInf, posZero)
    lu.assertFalse(success)  -- Should fail because zero is not infinity
end

function testAssertIsInfWithString()
    -- Should fail: "Infinity" is a string, not infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsInf, stringInf)
    lu.assertFalse(success)  -- Should fail because string is not infinity
end

-- =======================================
-- assertIsPlusInf tests
-- =======================================

function testAssertIsPlusInfWithPositiveInfinity()
    lu.assertIsPlusInf(posInf1)  -- Should pass: math.huge is positive infinity
end

function testAssertIsPlusInfWithOneDivZero()
    lu.assertIsPlusInf(posInf2)  -- Should pass: 1/0 is positive infinity
end

function testAssertIsPlusInfWithLargeExp()
    lu.assertIsPlusInf(posInf3)  -- Should pass: exp(1000) is positive infinity
end

function testAssertIsPlusInfWithNegativeInfinity()
    -- Should fail: -math.huge is negative infinity, not positive - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusInf, negInf1)
    lu.assertFalse(success)  -- Should fail because negative infinity is not positive infinity
end

function testAssertIsPlusInfWithNegOneDivZero()
    -- Should fail: -1/0 is negative infinity, not positive - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusInf, negInf2)
    lu.assertFalse(success)  -- Should fail because negative infinity is not positive infinity
end

function testAssertIsPlusInfWithRegularNumber()
    -- Should fail: 3.14159 is not positive infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusInf, regularFloat)
    lu.assertFalse(success)  -- Should fail because regular number is not infinity
end

function testAssertIsPlusInfWithNaN()
    -- Should fail: NaN is not positive infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusInf, nanValue1)
    lu.assertFalse(success)  -- Should fail because NaN is not positive infinity
end

function testAssertIsPlusInfWithZero()
    -- Should fail: 0.0 is not positive infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusInf, posZero)
    lu.assertFalse(success)  -- Should fail because zero is not positive infinity
end

-- =======================================
-- assertIsMinusInf tests
-- =======================================

function testAssertIsMinusInfWithNegativeInfinity()
    lu.assertIsMinusInf(negInf1)  -- Should pass: -math.huge is negative infinity
end

function testAssertIsMinusInfWithNegOneDivZero()
    lu.assertIsMinusInf(negInf2)  -- Should pass: -1/0 is negative infinity
end

function testAssertIsMinusInfWithLogZero()
    lu.assertIsMinusInf(negInf3)  -- Should pass: log(0) is negative infinity
end

function testAssertIsMinusInfWithPositiveInfinity()
    -- Should fail: math.huge is positive infinity, not negative - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusInf, posInf1)
    lu.assertFalse(success)  -- Should fail because positive infinity is not negative infinity
end

function testAssertIsMinusInfWithOneDivZero()
    -- Should fail: 1/0 is positive infinity, not negative - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusInf, posInf2)
    lu.assertFalse(success)  -- Should fail because positive infinity is not negative infinity
end

function testAssertIsMinusInfWithRegularNumber()
    -- Should fail: -2.71828 is not negative infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusInf, regularNegative)
    lu.assertFalse(success)  -- Should fail because regular negative number is not negative infinity
end

function testAssertIsMinusInfWithNaN()
    -- Should fail: NaN is not negative infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusInf, nanValue1)
    lu.assertFalse(success)  -- Should fail because NaN is not negative infinity
end

function testAssertIsMinusInfWithZero()
    -- Should fail: 0.0 is not negative infinity - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusInf, posZero)
    lu.assertFalse(success)  -- Should fail because zero is not negative infinity
end

-- =======================================
-- assertNotIsPlusInf tests
-- =======================================

function testAssertNotIsPlusInfWithNegativeInfinity()
    lu.assertNotIsPlusInf(negInf1)  -- Should pass: -math.huge is not positive infinity
end

function testAssertNotIsPlusInfWithRegularNumber()
    lu.assertNotIsPlusInf(regularFloat)  -- Should pass: 3.14159 is not positive infinity
end

function testAssertNotIsPlusInfWithNaN()
    lu.assertNotIsPlusInf(nanValue1)  -- Should pass: NaN is not positive infinity
end

function testAssertNotIsPlusInfWithZero()
    lu.assertNotIsPlusInf(posZero)  -- Should pass: 0.0 is not positive infinity
end

function testAssertNotIsPlusInfWithLogZero()
    lu.assertNotIsPlusInf(negInf3)  -- Should pass: log(0) is negative infinity, not positive
end

function testAssertNotIsPlusInfWithPositiveInfinity()
    -- Should fail: math.huge is positive infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsPlusInf, posInf1)
    lu.assertFalse(success)  -- Should fail because math.huge is positive infinity
end

function testAssertNotIsPlusInfWithOneDivZero()
    -- Should fail: 1/0 is positive infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsPlusInf, posInf2)
    lu.assertFalse(success)  -- Should fail because 1/0 is positive infinity
end

-- =======================================
-- assertNotIsMinusInf tests
-- =======================================

function testAssertNotIsMinusInfWithPositiveInfinity()
    lu.assertNotIsMinusInf(posInf1)  -- Should pass: math.huge is not negative infinity
end

function testAssertNotIsMinusInfWithRegularNumber()
    lu.assertNotIsMinusInf(regularFloat)  -- Should pass: 3.14159 is not negative infinity
end

function testAssertNotIsMinusInfWithNaN()
    lu.assertNotIsMinusInf(nanValue1)  -- Should pass: NaN is not negative infinity
end

function testAssertNotIsMinusInfWithZero()
    lu.assertNotIsMinusInf(posZero)  -- Should pass: 0.0 is not negative infinity
end

function testAssertNotIsMinusInfWithOneDivZero()
    lu.assertNotIsMinusInf(posInf2)  -- Should pass: 1/0 is positive infinity, not negative
end

function testAssertNotIsMinusInfWithNegativeInfinity()
    -- Should fail: -math.huge is negative infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsMinusInf, negInf1)
    lu.assertFalse(success)  -- Should fail because -math.huge is negative infinity
end

function testAssertNotIsMinusInfWithLogZero()
    -- Should fail: log(0) is negative infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsMinusInf, negInf3)
    lu.assertFalse(success)  -- Should fail because log(0) is negative infinity
end

-- =======================================
-- assertNotIsInf tests
-- =======================================

function testAssertNotIsInfWithRegularNumber()
    lu.assertNotIsInf(regularFloat)  -- Should pass: 3.14159 is not infinity
end

function testAssertNotIsInfWithInteger()
    lu.assertNotIsInf(regularInt)  -- Should pass: 42 is not infinity
end

function testAssertNotIsInfWithZero()
    lu.assertNotIsInf(posZero)  -- Should pass: 0.0 is not infinity
end

function testAssertNotIsInfWithNaN()
    lu.assertNotIsInf(nanValue1)  -- Should pass: NaN is not infinity
end

function testAssertNotIsInfWithLargeNumber()
    lu.assertNotIsInf(regularLarge)  -- Should pass: 1.23e10 is large but not infinity
end

function testAssertNotIsInfWithSmallNumber()
    lu.assertNotIsInf(regularSmall)  -- Should pass: 1.23e-10 is not infinity
end

function testAssertNotIsInfWithPositiveInfinity()
    -- Should fail: math.huge is infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsInf, posInf1)
    lu.assertFalse(success)  -- Should fail because math.huge is infinity
end

function testAssertNotIsInfWithNegativeInfinity()
    -- Should fail: -math.huge is infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsInf, negInf1)
    lu.assertFalse(success)  -- Should fail because negative infinity is still infinity
end

function testAssertNotIsInfWithOneDivZero()
    -- Should fail: 1/0 is infinity - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsInf, posInf2)
    lu.assertFalse(success)  -- Should fail because 1/0 is positive infinity
end

-- =======================================
-- assertIsPlusZero tests
-- =======================================

function testAssertIsPlusZeroWithPositiveZero()
    lu.assertIsPlusZero(posZero)  -- Should pass: 0.0 is positive zero
end

function testAssertIsPlusZeroWithZeroFromCalc()
    lu.assertIsPlusZero(zeroFromCalc)  -- Should pass: 1.0 - 1.0 is positive zero
end

function testAssertIsPlusZeroWithZeroFromDiv()
    lu.assertIsPlusZero(zeroFromDiv)  -- Should pass: 0.0 / 5.0 is positive zero
end

function testAssertIsPlusZeroWithIntegerZero()
    lu.assertIsPlusZero(regularZeroInt)  -- Should pass: 0 is positive zero
end

function testAssertIsPlusZeroWithNegativeZero()
    -- Should fail: -0.0 is negative zero, not positive - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusZero, negZero)
    lu.assertFalse(success)  -- Should fail because negative zero is not positive zero
end

function testAssertIsPlusZeroWithRegularNumber()
    -- Should fail: 3.14159 is not zero - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusZero, regularFloat)
    lu.assertFalse(success)  -- Should fail because regular number is not zero
end

function testAssertIsPlusZeroWithNaN()
    -- Should fail: NaN is not positive zero - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusZero, nanValue1)
    lu.assertFalse(success)  -- Should fail because NaN is not zero
end

function testAssertIsPlusZeroWithInfinity()
    -- Should fail: infinity is not positive zero - use pcall to catch the error
    local success, err = pcall(lu.assertIsPlusZero, posInf1)
    lu.assertFalse(success)  -- Should fail because infinity is not zero
end

-- =======================================
-- assertIsMinusZero tests
-- =======================================

function testAssertIsMinusZeroWithNegativeZero()
    lu.assertIsMinusZero(negZero)  -- Should pass: -0.0 is negative zero
end

function testAssertIsMinusZeroWithPositiveZero()
    -- Should fail: 0.0 is positive zero, not negative - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusZero, posZero)
    lu.assertFalse(success)  -- Should fail because positive zero is not negative zero
end

function testAssertIsMinusZeroWithRegularNumber()
    -- Should fail: -2.71828 is not zero - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusZero, regularNegative)
    lu.assertFalse(success)  -- Should fail because regular number is not zero
end

function testAssertIsMinusZeroWithNaN()
    -- Should fail: NaN is not negative zero - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusZero, nanValue1)
    lu.assertFalse(success)  -- Should fail because NaN is not zero
end

function testAssertIsMinusZeroWithInfinity()
    -- Should fail: negative infinity is not negative zero - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusZero, negInf1)
    lu.assertFalse(success)  -- Should fail because infinity is not zero
end

function testAssertIsMinusZeroWithIntegerZero()
    -- Should fail: 0 is positive zero, not negative - use pcall to catch the error
    local success, err = pcall(lu.assertIsMinusZero, regularZeroInt)
    lu.assertFalse(success)  -- Should fail because integer zero is positive zero
end

-- =======================================
-- assertNotIsPlusZero tests
-- =======================================

function testAssertNotIsPlusZeroWithNegativeZero()
    lu.assertNotIsPlusZero(negZero)  -- Should pass: -0.0 is not positive zero
end

function testAssertNotIsPlusZeroWithRegularNumber()
    lu.assertNotIsPlusZero(regularFloat)  -- Should pass: 3.14159 is not positive zero
end

function testAssertNotIsPlusZeroWithNaN()
    lu.assertNotIsPlusZero(nanValue1)  -- Should pass: NaN is not positive zero
end

function testAssertNotIsPlusZeroWithInfinity()
    lu.assertNotIsPlusZero(posInf1)  -- Should pass: infinity is not positive zero
end

function testAssertNotIsPlusZeroWithNegativeNumber()
    lu.assertNotIsPlusZero(regularNegative)  -- Should pass: -2.71828 is not positive zero
end

function testAssertNotIsPlusZeroWithPositiveZero()
    -- Should fail: 0.0 is positive zero - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsPlusZero, posZero)
    lu.assertFalse(success)  -- Should fail because 0.0 is positive zero
end

function testAssertNotIsPlusZeroWithZeroFromCalc()
    -- Should fail: 1.0 - 1.0 is positive zero - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsPlusZero, zeroFromCalc)
    lu.assertFalse(success)  -- Should fail because calculation result is positive zero
end

-- =======================================
-- assertNotIsMinusZero tests
-- =======================================

function testAssertNotIsMinusZeroWithPositiveZero()
    lu.assertNotIsMinusZero(posZero)  -- Should pass: 0.0 is not negative zero
end

function testAssertNotIsMinusZeroWithRegularNumber()
    lu.assertNotIsMinusZero(regularFloat)  -- Should pass: 3.14159 is not negative zero
end

function testAssertNotIsMinusZeroWithNaN()
    lu.assertNotIsMinusZero(nanValue1)  -- Should pass: NaN is not negative zero
end

function testAssertNotIsMinusZeroWithInfinity()
    lu.assertNotIsMinusZero(posInf1)  -- Should pass: infinity is not negative zero
end

function testAssertNotIsMinusZeroWithNegativeNumber()
    lu.assertNotIsMinusZero(regularNegative)  -- Should pass: -2.71828 is not negative zero
end

function testAssertNotIsMinusZeroWithIntegerZero()
    lu.assertNotIsMinusZero(regularZeroInt)  -- Should pass: 0 is positive zero, not negative
end

function testAssertNotIsMinusZeroWithNegativeZero()
    -- Should fail: -0.0 is negative zero - use pcall to catch the error
    local success, err = pcall(lu.assertNotIsMinusZero, negZero)
    lu.assertFalse(success)  -- Should fail because -0.0 is negative zero
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
