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
    lu.assertIsNumber(stringNumber)  -- Should fail: "123" is a string, not number
end

function testAssertIsNumberWithTable()
    lu.assertIsNumber(tableEmpty)  -- Should fail: {} is a table, not number
end

function testAssertIsNumberWithBoolean()
    lu.assertIsNumber(boolTrue)  -- Should fail: true is a boolean, not number
end

function testAssertIsNumberWithNil()
    lu.assertIsNumber(nilValue)  -- Should fail: nil is not a number
end

function testAssertIsNumberWithFunction()
    lu.assertIsNumber(simpleFunction)  -- Should fail: function is not a number
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
    lu.assertIsString(numberInt)  -- Should fail: 42 is a number, not string
end

function testAssertIsStringWithTable()
    lu.assertIsString(tableArray)  -- Should fail: {1,2,3,4,5} is a table, not string
end

function testAssertIsStringWithBoolean()
    lu.assertIsString(boolFalse)  -- Should fail: false is a boolean, not string
end

function testAssertIsStringWithNil()
    lu.assertIsString(nilValue)  -- Should fail: nil is not a string
end

function testAssertIsStringWithFunction()
    lu.assertIsString(functionAnonymous)  -- Should fail: function is not a string
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
    lu.assertIsTable(numberFloat)  -- Should fail: 3.14159 is a number, not table
end

function testAssertIsTableWithString()
    lu.assertIsTable(stringSimple)  -- Should fail: "Hello, World!" is a string, not table
end

function testAssertIsTableWithBoolean()
    lu.assertIsTable(boolTrue)  -- Should fail: true is a boolean, not table
end

function testAssertIsTableWithNil()
    lu.assertIsTable(nilValue)  -- Should fail: nil is not a table
end

function testAssertIsTableWithFunction()
    lu.assertIsTable(functionWithArgs)  -- Should fail: function is not a table
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
    lu.assertIsBoolean(numberZero)  -- Should fail: 0 is a number, not boolean
end

function testAssertIsBooleanWithString()
    lu.assertIsBoolean(stringEmpty)  -- Should fail: "" is a string, not boolean
end

function testAssertIsBooleanWithTable()
    lu.assertIsBoolean(tableEmpty)  -- Should fail: {} is a table, not boolean
end

function testAssertIsBooleanWithNil()
    lu.assertIsBoolean(nilValue)  -- Should fail: nil is not a boolean
end

function testAssertIsBooleanWithFunction()
    lu.assertIsBoolean(simpleFunction)  -- Should fail: function is not a boolean
end

function testAssertIsBooleanWithUserdata()
    if userdataFile then
        lu.assertIsBoolean(userdataFile)  -- Should fail: file handle is userdata, not boolean
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
    lu.assertIsNil(numberZero)  -- Should fail: 0 is a number, not nil
end

function testAssertIsNilWithEmptyString()
    lu.assertIsNil(stringEmpty)  -- Should fail: "" is a string, not nil
end

function testAssertIsNilWithEmptyTable()
    lu.assertIsNil(tableEmpty)  -- Should fail: {} is a table, not nil
end

function testAssertIsNilWithFalse()
    lu.assertIsNil(boolFalse)  -- Should fail: false is a boolean, not nil
end

function testAssertIsNilWithFunction()
    lu.assertIsNil(functionBuiltin)  -- Should fail: print is a function, not nil
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
    lu.assertIsFunction(numberInt)  -- Should fail: 42 is a number, not function
end

function testAssertIsFunctionWithString()
    lu.assertIsFunction(stringSimple)  -- Should fail: "Hello, World!" is a string, not function
end

function testAssertIsFunctionWithTable()
    lu.assertIsFunction(tableHash)  -- Should fail: table is not a function
end

function testAssertIsFunctionWithBoolean()
    lu.assertIsFunction(boolTrue)  -- Should fail: true is a boolean, not function
end

function testAssertIsFunctionWithNil()
    lu.assertIsFunction(nilValue)  -- Should fail: nil is not a function
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
    lu.assertIsUserdata(numberInt)  -- Should fail: 42 is a number, not userdata
end

function testAssertIsUserdataWithString()
    lu.assertIsUserdata(stringSimple)  -- Should fail: "Hello, World!" is a string, not userdata
end

function testAssertIsUserdataWithTable()
    lu.assertIsUserdata(tableArray)  -- Should fail: {1,2,3,4,5} is a table, not userdata
end

function testAssertIsUserdataWithBoolean()
    lu.assertIsUserdata(boolFalse)  -- Should fail: false is a boolean, not userdata
end

function testAssertIsUserdataWithNil()
    lu.assertIsUserdata(nilValue)  -- Should fail: nil is not userdata
end

function testAssertIsUserdataWithFunction()
    lu.assertIsUserdata(functionMath)  -- Should fail: math.sin is a function, not userdata
end

function testAssertIsUserdataWithCoroutine()
    lu.assertIsUserdata(coroutineSimple)  -- Should fail: coroutine is thread, not userdata
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
    lu.assertIsCoroutine(numberInt)  -- Should fail: 42 is a number, not coroutine
end

function testAssertIsCoroutineWithString()
    lu.assertIsCoroutine(stringSimple)  -- Should fail: "Hello, World!" is a string, not coroutine
end

function testAssertIsCoroutineWithTable()
    lu.assertIsCoroutine(tableEmpty)  -- Should fail: {} is a table, not coroutine
end

function testAssertIsCoroutineWithBoolean()
    lu.assertIsCoroutine(boolTrue)  -- Should fail: true is a boolean, not coroutine
end

function testAssertIsCoroutineWithNil()
    lu.assertIsCoroutine(nilValue)  -- Should fail: nil is not coroutine
end

function testAssertIsCoroutineWithFunction()
    lu.assertIsCoroutine(simpleFunction)  -- Should fail: function is not coroutine
end

function testAssertIsCoroutineWithUserdata()
    if userdataFile then
        lu.assertIsCoroutine(userdataFile)  -- Should fail: file handle is userdata, not coroutine
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
    lu.assertIsThread(numberFloat)  -- Should fail: 3.14159 is a number, not thread
end

function testAssertIsThreadWithString()
    lu.assertIsThread(stringMultiline)  -- Should fail: multiline string is a string, not thread
end

function testAssertIsThreadWithTable()
    lu.assertIsThread(tableMixed)  -- Should fail: mixed table is a table, not thread
end

function testAssertIsThreadWithBoolean()
    lu.assertIsThread(boolFalse)  -- Should fail: false is a boolean, not thread
end

function testAssertIsThreadWithNil()
    lu.assertIsThread(nilValue)  -- Should fail: nil is not thread
end

function testAssertIsThreadWithFunction()
    lu.assertIsThread(functionBuiltin)  -- Should fail: print is a function, not thread
end

function testAssertIsThreadWithUserdata()
    if userdataFile then
        lu.assertIsThread(userdataFile)  -- Should fail: file handle is userdata, not thread
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
