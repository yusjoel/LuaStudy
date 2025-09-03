-- Demonstration of Type Assertions in LuaUnit
-- Type assertion functions: assertIsNumber, assertIsString, assertIsTable, assertIsBoolean, assertIsNil, assertIsFunction, assertIsUserdata, assertIsCoroutine, assertIsThread
-- Run with: lua testTypeAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- Test data of different types
-- =======================================

-- Numbers
local numberInt = 42
local numberFloat = 3.14159
local numberNegative = -100
local numberZero = 0
local numberExp = 1.23e-4
local numberHex = 0xFF
local numberInf = math.huge
local numberNaN = 0/0

-- Strings
local stringEmpty = ""
local stringSimple = "Hello, World!"
local stringMultiline = "Line 1\nLine 2\nLine 3"
local stringNumber = "123"
local stringSpecial = "Special chars: !@#$%^&*()"
local stringUnicode = "Unicode: αβγδε"

-- Tables
local tableEmpty = {}
local tableArray = {1, 2, 3, 4, 5}
local tableHash = {name = "John", age = 30, city = "New York"}
local tableMixed = {1, 2, name = "Mixed", [10] = "ten"}
local tableNested = {inner = {value = 42}, array = {1, 2, 3}}

-- Booleans
local boolTrue = true
local boolFalse = false

-- Nil
local nilValue = nil

-- Functions
local function simpleFunction() return "simple" end
local function functionWithArgs(a, b) return a + b end
local functionAnonymous = function() return "anonymous" end
local functionBuiltin = print
local functionMath = math.sin

-- Userdata (file handle example)
local tempFile = io.open("temp_test_file.txt", "w")
if tempFile then
    tempFile:write("test")
    tempFile:close()
end
local fileHandle = io.open("temp_test_file.txt", "r")
local userdataFile = fileHandle

-- Coroutines/Threads
local coroutineSimple = coroutine.create(function() return "coroutine" end)
local coroutineWithYield = coroutine.create(function()
    coroutine.yield(1)
    coroutine.yield(2)
    return 3
end)

-- =======================================
-- assertIsNumber tests
-- =======================================

function testAssertIsNumberWithInteger()
    lu.assertIsNumber(numberInt)  -- Should pass: 42 is a number
end

function testAssertIsNumberWithFloat()
    lu.assertIsNumber(numberFloat)  -- Should pass: 3.14159 is a number
end

function testAssertIsNumberWithNegative()
    lu.assertIsNumber(numberNegative)  -- Should pass: -100 is a number
end

function testAssertIsNumberWithZero()
    lu.assertIsNumber(numberZero)  -- Should pass: 0 is a number
end

function testAssertIsNumberWithExponential()
    lu.assertIsNumber(numberExp)  -- Should pass: 1.23e-4 is a number
end

function testAssertIsNumberWithHexadecimal()
    lu.assertIsNumber(numberHex)  -- Should pass: 0xFF is a number
end

function testAssertIsNumberWithInfinity()
    lu.assertIsNumber(numberInf)  -- Should pass: math.huge is a number
end

function testAssertIsNumberWithNaN()
    lu.assertIsNumber(numberNaN)  -- Should pass: 0/0 is a number (NaN)
end

function testAssertIsNumberWithString()
    -- Should fail: "123" is a string, not number - use pcall to catch the error
    local success, err = pcall(lu.assertIsNumber, stringNumber)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNumberWithTable()
    -- Should fail: {} is a table, not number - use pcall to catch the error
    local success, err = pcall(lu.assertIsNumber, tableEmpty)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNumberWithBoolean()
    -- Should fail: true is a boolean, not number - use pcall to catch the error
    local success, err = pcall(lu.assertIsNumber, boolTrue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNumberWithNil()
    -- Should fail: nil is not a number - use pcall to catch the error
    local success, err = pcall(lu.assertIsNumber, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNumberWithFunction()
    -- Should fail: function is not a number - use pcall to catch the error
    local success, err = pcall(lu.assertIsNumber, simpleFunction)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertIsString tests
-- =======================================

function testAssertIsStringWithEmpty()
    lu.assertIsString(stringEmpty)  -- Should pass: "" is a string
end

function testAssertIsStringWithSimple()
    lu.assertIsString(stringSimple)  -- Should pass: "Hello, World!" is a string
end

function testAssertIsStringWithMultiline()
    lu.assertIsString(stringMultiline)  -- Should pass: multiline string is a string
end

function testAssertIsStringWithNumbers()
    lu.assertIsString(stringNumber)  -- Should pass: "123" is a string
end

function testAssertIsStringWithSpecialChars()
    lu.assertIsString(stringSpecial)  -- Should pass: string with special chars is a string
end

function testAssertIsStringWithUnicode()
    lu.assertIsString(stringUnicode)  -- Should pass: unicode string is a string
end

function testAssertIsStringWithNumber()
    -- Should fail: 42 is a number, not string - use pcall to catch the error
    local success, err = pcall(lu.assertIsString, numberInt)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsStringWithTable()
    -- Should fail: {1,2,3,4,5} is a table, not string - use pcall to catch the error
    local success, err = pcall(lu.assertIsString, tableArray)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsStringWithBoolean()
    -- Should fail: false is a boolean, not string - use pcall to catch the error
    local success, err = pcall(lu.assertIsString, boolFalse)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsStringWithNil()
    -- Should fail: nil is not a string - use pcall to catch the error
    local success, err = pcall(lu.assertIsString, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsStringWithFunction()
    -- Should fail: function is not a string - use pcall to catch the error
    local success, err = pcall(lu.assertIsString, functionAnonymous)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertIsTable tests
-- =======================================

function testAssertIsTableWithEmpty()
    lu.assertIsTable(tableEmpty)  -- Should pass: {} is a table
end

function testAssertIsTableWithArray()
    lu.assertIsTable(tableArray)  -- Should pass: {1,2,3,4,5} is a table
end

function testAssertIsTableWithHash()
    lu.assertIsTable(tableHash)  -- Should pass: {name="John",...} is a table
end

function testAssertIsTableWithMixed()
    lu.assertIsTable(tableMixed)  -- Should pass: mixed table is a table
end

function testAssertIsTableWithNested()
    lu.assertIsTable(tableNested)  -- Should pass: nested table is a table
end

function testAssertIsTableWithNumber()
    -- Should fail: 3.14159 is a number, not table - use pcall to catch the error
    local success, err = pcall(lu.assertIsTable, numberFloat)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsTableWithString()
    -- Should fail: "Hello, World!" is a string, not table - use pcall to catch the error
    local success, err = pcall(lu.assertIsTable, stringSimple)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsTableWithBoolean()
    -- Should fail: true is a boolean, not table - use pcall to catch the error
    local success, err = pcall(lu.assertIsTable, boolTrue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsTableWithNil()
    -- Should fail: nil is not a table - use pcall to catch the error
    local success, err = pcall(lu.assertIsTable, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsTableWithFunction()
    -- Should fail: function is not a table - use pcall to catch the error
    local success, err = pcall(lu.assertIsTable, functionWithArgs)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertIsBoolean tests
-- =======================================

function testAssertIsBooleanWithTrue()
    lu.assertIsBoolean(boolTrue)  -- Should pass: true is a boolean
end

function testAssertIsBooleanWithFalse()
    lu.assertIsBoolean(boolFalse)  -- Should pass: false is a boolean
end

function testAssertIsBooleanWithNumber()
    -- Should fail: 0 is a number, not boolean - use pcall to catch the error
    local success, err = pcall(lu.assertIsBoolean, numberZero)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsBooleanWithString()
    -- Should fail: "" is a string, not boolean - use pcall to catch the error
    local success, err = pcall(lu.assertIsBoolean, stringEmpty)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsBooleanWithTable()
    -- Should fail: {} is a table, not boolean - use pcall to catch the error
    local success, err = pcall(lu.assertIsBoolean, tableEmpty)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsBooleanWithNil()
    -- Should fail: nil is not a boolean - use pcall to catch the error
    local success, err = pcall(lu.assertIsBoolean, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsBooleanWithFunction()
    -- Should fail: function is not a boolean - use pcall to catch the error
    local success, err = pcall(lu.assertIsBoolean, simpleFunction)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsBooleanWithUserdata()
    if userdataFile then
        -- Should fail: file handle is userdata, not boolean - use pcall to catch the error
        local success, err = pcall(lu.assertIsBoolean, userdataFile)
        lu.assertFalse(success)  -- Should fail due to type mismatch
    end
end

-- =======================================
-- assertIsNil tests
-- =======================================

function testAssertIsNilWithNil()
    lu.assertIsNil(nilValue)  -- Should pass: nil is nil
end

function testAssertIsNilWithUndefinedVariable()
    lu.assertIsNil(undefinedVariable)  -- Should pass: undefined variable is nil
end

function testAssertIsNilWithNumber()
    -- Should fail: 0 is a number, not nil - use pcall to catch the error
    local success, err = pcall(lu.assertIsNil, numberZero)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNilWithEmptyString()
    -- Should fail: "" is a string, not nil - use pcall to catch the error
    local success, err = pcall(lu.assertIsNil, stringEmpty)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNilWithEmptyTable()
    -- Should fail: {} is a table, not nil - use pcall to catch the error
    local success, err = pcall(lu.assertIsNil, tableEmpty)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNilWithFalse()
    -- Should fail: false is a boolean, not nil - use pcall to catch the error
    local success, err = pcall(lu.assertIsNil, boolFalse)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsNilWithFunction()
    -- Should fail: print is a function, not nil - use pcall to catch the error
    local success, err = pcall(lu.assertIsNil, functionBuiltin)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertIsFunction tests
-- =======================================

function testAssertIsFunctionWithSimple()
    lu.assertIsFunction(simpleFunction)  -- Should pass: simpleFunction is a function
end

function testAssertIsFunctionWithArgs()
    lu.assertIsFunction(functionWithArgs)  -- Should pass: functionWithArgs is a function
end

function testAssertIsFunctionWithAnonymous()
    lu.assertIsFunction(functionAnonymous)  -- Should pass: anonymous function is a function
end

function testAssertIsFunctionWithBuiltin()
    lu.assertIsFunction(functionBuiltin)  -- Should pass: print is a function
end

function testAssertIsFunctionWithMath()
    lu.assertIsFunction(functionMath)  -- Should pass: math.sin is a function
end

function testAssertIsFunctionWithNumber()
    -- Should fail: 42 is a number, not function - use pcall to catch the error
    local success, err = pcall(lu.assertIsFunction, numberInt)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsFunctionWithString()
    -- Should fail: "Hello, World!" is a string, not function - use pcall to catch the error
    local success, err = pcall(lu.assertIsFunction, stringSimple)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsFunctionWithTable()
    -- Should fail: table is not a function - use pcall to catch the error
    local success, err = pcall(lu.assertIsFunction, tableHash)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsFunctionWithBoolean()
    -- Should fail: true is a boolean, not function - use pcall to catch the error
    local success, err = pcall(lu.assertIsFunction, boolTrue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsFunctionWithNil()
    -- Should fail: nil is not a function - use pcall to catch the error
    local success, err = pcall(lu.assertIsFunction, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertIsUserdata tests
-- =======================================

function testAssertIsUserdataWithFileHandle()
    if userdataFile then
        lu.assertIsUserdata(userdataFile)  -- Should pass: file handle is userdata
    end
end

function testAssertIsUserdataWithNumber()
    -- Should fail: 42 is a number, not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, numberInt)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsUserdataWithString()
    -- Should fail: "Hello, World!" is a string, not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, stringSimple)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsUserdataWithTable()
    -- Should fail: {1,2,3,4,5} is a table, not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, tableArray)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsUserdataWithBoolean()
    -- Should fail: false is a boolean, not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, boolFalse)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsUserdataWithNil()
    -- Should fail: nil is not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsUserdataWithFunction()
    -- Should fail: math.sin is a function, not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, functionMath)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsUserdataWithCoroutine()
    -- Should fail: coroutine is thread, not userdata - use pcall to catch the error
    local success, err = pcall(lu.assertIsUserdata, coroutineSimple)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

-- =======================================
-- assertIsCoroutine tests (same as assertIsThread)
-- =======================================

function testAssertIsCoroutineWithSimple()
    lu.assertIsCoroutine(coroutineSimple)  -- Should pass: coroutine is a coroutine/thread
end

function testAssertIsCoroutineWithYield()
    lu.assertIsCoroutine(coroutineWithYield)  -- Should pass: coroutine with yield is a coroutine/thread
end

function testAssertIsCoroutineWithNumber()
    -- Should fail: 42 is a number, not coroutine - use pcall to catch the error
    local success, err = pcall(lu.assertIsCoroutine, numberInt)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsCoroutineWithString()
    -- Should fail: "Hello, World!" is a string, not coroutine - use pcall to catch the error
    local success, err = pcall(lu.assertIsCoroutine, stringSimple)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsCoroutineWithTable()
    -- Should fail: {} is a table, not coroutine - use pcall to catch the error
    local success, err = pcall(lu.assertIsCoroutine, tableEmpty)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsCoroutineWithBoolean()
    -- Should fail: true is a boolean, not coroutine - use pcall to catch the error
    local success, err = pcall(lu.assertIsCoroutine, boolTrue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsCoroutineWithNil()
    -- Should fail: nil is not coroutine - use pcall to catch the error
    local success, err = pcall(lu.assertIsCoroutine, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsCoroutineWithFunction()
    -- Should fail: function is not coroutine - use pcall to catch the error
    local success, err = pcall(lu.assertIsCoroutine, simpleFunction)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsCoroutineWithUserdata()
    if userdataFile then
        -- Should fail: file handle is userdata, not coroutine - use pcall to catch the error
        local success, err = pcall(lu.assertIsCoroutine, userdataFile)
        lu.assertFalse(success)  -- Should fail due to type mismatch
    end
end

-- =======================================
-- assertIsThread tests (same as assertIsCoroutine)
-- =======================================

function testAssertIsThreadWithSimple()
    lu.assertIsThread(coroutineSimple)  -- Should pass: coroutine is a thread
end

function testAssertIsThreadWithYield()
    lu.assertIsThread(coroutineWithYield)  -- Should pass: coroutine with yield is a thread
end

function testAssertIsThreadWithNumber()
    -- Should fail: 3.14159 is a number, not thread - use pcall to catch the error
    local success, err = pcall(lu.assertIsThread, numberFloat)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsThreadWithString()
    -- Should fail: multiline string is a string, not thread - use pcall to catch the error
    local success, err = pcall(lu.assertIsThread, stringMultiline)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsThreadWithTable()
    -- Should fail: mixed table is a table, not thread - use pcall to catch the error
    local success, err = pcall(lu.assertIsThread, tableMixed)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsThreadWithBoolean()
    -- Should fail: false is a boolean, not thread - use pcall to catch the error
    local success, err = pcall(lu.assertIsThread, boolFalse)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsThreadWithNil()
    -- Should fail: nil is not thread - use pcall to catch the error
    local success, err = pcall(lu.assertIsThread, nilValue)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsThreadWithFunction()
    -- Should fail: print is a function, not thread - use pcall to catch the error
    local success, err = pcall(lu.assertIsThread, functionBuiltin)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertIsThreadWithUserdata()
    if userdataFile then
        -- Should fail: file handle is userdata, not thread - use pcall to catch the error
        local success, err = pcall(lu.assertIsThread, userdataFile)
        lu.assertFalse(success)  -- Should fail due to type mismatch
    end
end

-- =======================================
-- Cleanup and run tests
-- =======================================

-- Cleanup temporary file
if userdataFile then
    userdataFile:close()
    os.remove("temp_test_file.txt")
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
