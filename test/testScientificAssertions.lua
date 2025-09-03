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
    lu.assertIsNaN(regularFloat)  -- Should fail: 3.14159 is not NaN
end

function testAssertIsNaNWithPositiveInfinity()
    lu.assertIsNaN(posInf1)  -- Should fail: math.huge is infinity, not NaN
end

function testAssertIsNaNWithNegativeInfinity()
    lu.assertIsNaN(negInf1)  -- Should fail: -math.huge is infinity, not NaN
end

function testAssertIsNaNWithZero()
    lu.assertIsNaN(posZero)  -- Should fail: 0.0 is not NaN
end

function testAssertIsNaNWithInteger()
    lu.assertIsNaN(regularInt)  -- Should fail: 42 is not NaN
end

function testAssertIsNaNWithString()
    lu.assertIsNaN(stringNaN)  -- Should fail: "NaN" is a string, not NaN
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
    lu.assertNotIsNaN(nanValue1)  -- Should fail: 0/0 is NaN
end

function testAssertNotIsNaNWithSqrtNegative()
    lu.assertNotIsNaN(nanValue2)  -- Should fail: sqrt(-1) is NaN
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
    lu.assertIsInf(regularFloat)  -- Should fail: 3.14159 is not infinity
end

function testAssertIsInfWithNaN()
    lu.assertIsInf(nanValue1)  -- Should fail: NaN is not infinity
end

function testAssertIsInfWithZero()
    lu.assertIsInf(posZero)  -- Should fail: 0.0 is not infinity
end

function testAssertIsInfWithString()
    lu.assertIsInf(stringInf)  -- Should fail: "Infinity" is a string, not infinity
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
    lu.assertIsPlusInf(negInf1)  -- Should fail: -math.huge is negative infinity, not positive
end

function testAssertIsPlusInfWithNegOneDivZero()
    lu.assertIsPlusInf(negInf2)  -- Should fail: -1/0 is negative infinity, not positive
end

function testAssertIsPlusInfWithRegularNumber()
    lu.assertIsPlusInf(regularFloat)  -- Should fail: 3.14159 is not positive infinity
end

function testAssertIsPlusInfWithNaN()
    lu.assertIsPlusInf(nanValue1)  -- Should fail: NaN is not positive infinity
end

function testAssertIsPlusInfWithZero()
    lu.assertIsPlusInf(posZero)  -- Should fail: 0.0 is not positive infinity
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
    lu.assertIsMinusInf(posInf1)  -- Should fail: math.huge is positive infinity, not negative
end

function testAssertIsMinusInfWithOneDivZero()
    lu.assertIsMinusInf(posInf2)  -- Should fail: 1/0 is positive infinity, not negative
end

function testAssertIsMinusInfWithRegularNumber()
    lu.assertIsMinusInf(regularNegative)  -- Should fail: -2.71828 is not negative infinity
end

function testAssertIsMinusInfWithNaN()
    lu.assertIsMinusInf(nanValue1)  -- Should fail: NaN is not negative infinity
end

function testAssertIsMinusInfWithZero()
    lu.assertIsMinusInf(posZero)  -- Should fail: 0.0 is not negative infinity
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
    lu.assertNotIsPlusInf(posInf1)  -- Should fail: math.huge is positive infinity
end

function testAssertNotIsPlusInfWithOneDivZero()
    lu.assertNotIsPlusInf(posInf2)  -- Should fail: 1/0 is positive infinity
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
    lu.assertNotIsMinusInf(negInf1)  -- Should fail: -math.huge is negative infinity
end

function testAssertNotIsMinusInfWithLogZero()
    lu.assertNotIsMinusInf(negInf3)  -- Should fail: log(0) is negative infinity
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
    lu.assertNotIsInf(posInf1)  -- Should fail: math.huge is infinity
end

function testAssertNotIsInfWithNegativeInfinity()
    lu.assertNotIsInf(negInf1)  -- Should fail: -math.huge is infinity
end

function testAssertNotIsInfWithOneDivZero()
    lu.assertNotIsInf(posInf2)  -- Should fail: 1/0 is infinity
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
    lu.assertIsPlusZero(negZero)  -- Should fail: -0.0 is negative zero, not positive
end

function testAssertIsPlusZeroWithRegularNumber()
    lu.assertIsPlusZero(regularFloat)  -- Should fail: 3.14159 is not zero
end

function testAssertIsPlusZeroWithNaN()
    lu.assertIsPlusZero(nanValue1)  -- Should fail: NaN is not positive zero
end

function testAssertIsPlusZeroWithInfinity()
    lu.assertIsPlusZero(posInf1)  -- Should fail: infinity is not positive zero
end

-- =======================================
-- assertIsMinusZero tests
-- =======================================

function testAssertIsMinusZeroWithNegativeZero()
    lu.assertIsMinusZero(negZero)  -- Should pass: -0.0 is negative zero
end

function testAssertIsMinusZeroWithPositiveZero()
    lu.assertIsMinusZero(posZero)  -- Should fail: 0.0 is positive zero, not negative
end

function testAssertIsMinusZeroWithRegularNumber()
    lu.assertIsMinusZero(regularNegative)  -- Should fail: -2.71828 is not zero
end

function testAssertIsMinusZeroWithNaN()
    lu.assertIsMinusZero(nanValue1)  -- Should fail: NaN is not negative zero
end

function testAssertIsMinusZeroWithInfinity()
    lu.assertIsMinusZero(negInf1)  -- Should fail: negative infinity is not negative zero
end

function testAssertIsMinusZeroWithIntegerZero()
    lu.assertIsMinusZero(regularZeroInt)  -- Should fail: 0 is positive zero, not negative
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
    lu.assertNotIsPlusZero(posZero)  -- Should fail: 0.0 is positive zero
end

function testAssertNotIsPlusZeroWithZeroFromCalc()
    lu.assertNotIsPlusZero(zeroFromCalc)  -- Should fail: 1.0 - 1.0 is positive zero
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
    lu.assertNotIsMinusZero(negZero)  -- Should fail: -0.0 is negative zero
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
