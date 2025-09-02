-- Demonstration of Error Assertions in LuaUnit
-- Error assertion functions: assertError, assertErrorMsgEquals, assertErrorMsgContentEquals, assertErrorMsgContains, assertErrorMsgMatches
-- Run with: lua testErrorAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- Test functions that generate errors
-- =======================================

-- Functions that throw specific errors
function throwSimpleError()
    error("Simple error message")
end

function throwDivisionByZeroError()
    error("Division by zero not allowed")
end

function throwFileNotFoundError()
    error("File not found: config.txt")
end

function throwInvalidArgumentError()
    error("Invalid argument: expected number, got string")
end

function throwNilReferenceError()
    error("Attempt to index a nil value")
end

function throwTypeError()
    error("attempt to perform arithmetic on local 'x' (a string value)")
end

function throwCustomError()
    error({code = 500, message = "Internal Server Error"})
end

function throwEmptyError()
    error("")
end

function throwNumberError()
    error(42)
end

function throwTableError()
    error({type = "validation", field = "email", message = "Invalid email format"})
end

-- Functions that do NOT throw errors
function noError()
    return "success"
end

function returnNil()
    return nil
end

function returnFalse()
    return false
end

function returnZero()
    return 0
end

function returnEmptyString()
    return ""
end

-- Functions that throw errors with arguments
function divideByZero(a, b)
    if b == 0 then
        error("Cannot divide by zero")
    end
    return a / b
end

function validateAge(age)
    if type(age) ~= "number" then
        error("Age must be a number, got " .. type(age))
    end
    if age < 0 then
        error("Age cannot be negative: " .. age)
    end
    if age > 150 then
        error("Age cannot exceed 150: " .. age)
    end
    return age
end

function openFile(filename)
    if not filename then
        error("Filename cannot be nil")
    end
    if filename == "" then
        error("Filename cannot be empty")
    end
    if filename == "nonexistent.txt" then
        error("File does not exist: " .. filename)
    end
    return "File opened: " .. filename
end

-- =======================================
-- assertError tests
-- =======================================

function testAssertErrorWithSimpleError()
    lu.assertError(throwSimpleError)  -- Should pass: function throws an error
end

function testAssertErrorWithDivisionByZero()
    lu.assertError(throwDivisionByZeroError)  -- Should pass: function throws an error
end

function testAssertErrorWithFileNotFound()
    lu.assertError(throwFileNotFoundError)  -- Should pass: function throws an error
end

function testAssertErrorWithCustomError()
    lu.assertError(throwCustomError)  -- Should pass: function throws an error (table)
end

function testAssertErrorWithNumberError()
    lu.assertError(throwNumberError)  -- Should pass: function throws an error (number)
end

function testAssertErrorWithEmptyError()
    lu.assertError(throwEmptyError)  -- Should pass: function throws an error (empty string)
end

function testAssertErrorWithFunctionAndArgs()
    lu.assertError(divideByZero, 10, 0)  -- Should pass: function throws error with args
end

function testAssertErrorWithValidateAge()
    lu.assertError(validateAge, "not a number")  -- Should pass: function throws error with invalid arg
end

function testAssertErrorWithOpenFile()
    lu.assertError(openFile, "nonexistent.txt")  -- Should pass: function throws error
end

function testAssertErrorWithNoError()
    lu.assertError(noError)  -- Should fail: function does not throw an error
end

function testAssertErrorWithReturnNil()
    lu.assertError(returnNil)  -- Should fail: function does not throw an error
end

function testAssertErrorWithReturnFalse()
    lu.assertError(returnFalse)  -- Should fail: function does not throw an error
end

function testAssertErrorWithSuccessfulDivision()
    lu.assertError(divideByZero, 10, 2)  -- Should fail: function succeeds, no error
end

function testAssertErrorWithValidAge()
    lu.assertError(validateAge, 25)  -- Should fail: function succeeds with valid age
end

function testAssertErrorWithValidFile()
    lu.assertError(openFile, "valid.txt")  -- Should fail: function succeeds with valid filename
end

-- =======================================
-- assertErrorMsgEquals tests - NOT RECOMMENDED
-- =======================================
-- NOTE: assertErrorMsgEquals is not recommended for use because error messages
-- usually contain file name and line number information, making exact matching
-- difficult and brittle. Use assertErrorMsgContentEquals instead.
--
-- All assertErrorMsgEquals tests have been removed due to this limitation.
-- For exact error message content matching without file/line info, use assertErrorMsgContentEquals.
-- For partial message matching, use assertErrorMsgContains.
-- For pattern matching, use assertErrorMsgMatches.

-- =======================================
-- assertErrorMsgContentEquals tests
-- =======================================

function testAssertErrorMsgContentEqualsSimpleError()
    lu.assertErrorMsgContentEquals("Simple error message", throwSimpleError)  -- Should pass: exact content match
end

function testAssertErrorMsgContentEqualsDivisionByZero()
    lu.assertErrorMsgContentEquals("Division by zero not allowed", throwDivisionByZeroError)  -- Should pass: exact match
end

function testAssertErrorMsgContentEqualsWithArgs()
    lu.assertErrorMsgContentEquals("Cannot divide by zero", divideByZero, 8, 0)  -- Should pass: exact content match
end

function testAssertErrorMsgContentEqualsValidateAge()
    lu.assertErrorMsgContentEquals("Age must be a number, got table", validateAge, {})  -- Should pass: exact match
end

function testAssertErrorMsgContentEqualsFileNotFound()
    lu.assertErrorMsgContentEquals("File not found: config.txt", throwFileNotFoundError)  -- Should pass: exact match
end

function testAssertErrorMsgContentEqualsEmptyError()
    lu.assertErrorMsgContentEquals("", throwEmptyError)  -- Should pass: empty content match
end

function testAssertErrorMsgContentEqualsOpenFileEmpty()
    lu.assertErrorMsgContentEquals("Filename cannot be empty", openFile, "")  -- Should pass: exact match
end

function testAssertErrorMsgContentEqualsWrongContent()
    lu.assertErrorMsgContentEquals("Different error message", throwSimpleError)  -- Should fail: content doesn't match
end

function testAssertErrorMsgContentEqualsPartialContent()
    lu.assertErrorMsgContentEquals("Simple error", throwSimpleError)  -- Should fail: only partial content
end

function testAssertErrorMsgContentEqualsNoError()
    lu.assertErrorMsgContentEquals("Any content", returnNil)  -- Should fail: function doesn't throw error
end

-- =======================================
-- assertErrorMsgContains tests
-- =======================================

function testAssertErrorMsgContainsSimpleInSimpleError()
    lu.assertErrorMsgContains("Simple", throwSimpleError)  -- Should pass: "Simple" in "Simple error message"
end

function testAssertErrorMsgContainsErrorInSimpleError()
    lu.assertErrorMsgContains("error", throwSimpleError)  -- Should pass: "error" in "Simple error message"
end

function testAssertErrorMsgContainsDivisionInDivisionError()
    lu.assertErrorMsgContains("Division", throwDivisionByZeroError)  -- Should pass: "Division" in message
end

function testAssertErrorMsgContainsZeroInDivisionError()
    lu.assertErrorMsgContains("zero", throwDivisionByZeroError)  -- Should pass: "zero" in message
end

function testAssertErrorMsgContainsFileInFileError()
    lu.assertErrorMsgContains("File", throwFileNotFoundError)  -- Should pass: "File" in message
end

function testAssertErrorMsgContainsConfigInFileError()
    lu.assertErrorMsgContains("config.txt", throwFileNotFoundError)  -- Should pass: "config.txt" in message
end

function testAssertErrorMsgContainsWithArgs()
    lu.assertErrorMsgContains("divide", divideByZero, 7, 0)  -- Should pass: "divide" in "Cannot divide by zero"
end

function testAssertErrorMsgContainsAgeInValidateError()
    lu.assertErrorMsgContains("Age", validateAge, "invalid")  -- Should pass: "Age" in error message
end

function testAssertErrorMsgContainsNumberInValidateError()
    lu.assertErrorMsgContains("number", validateAge, true)  -- Should pass: "number" in error message
end

function testAssertErrorMsgContainsXyzInSimpleError()
    lu.assertErrorMsgContains("xyz", throwSimpleError)  -- Should fail: "xyz" not in "Simple error message"
end

function testAssertErrorMsgContainsCaseSensitive()
    lu.assertErrorMsgContains("SIMPLE", throwSimpleError)  -- Should fail: case sensitive, "SIMPLE" not in message
end

function testAssertErrorMsgContainsNoError()
    lu.assertErrorMsgContains("anything", noError)  -- Should fail: function doesn't throw error
end

function testAssertErrorMsgContainsEmptyInError()
    lu.assertErrorMsgContains("", throwSimpleError)  -- Should pass: empty string contained in any string
end

function testAssertErrorMsgContainsLongSubstring()
    lu.assertErrorMsgContains("This is a very long substring that doesn't exist", throwSimpleError)  -- Should fail
end

function testAssertErrorMsgContainsFilenameInOpenFile()
    lu.assertErrorMsgContains("nonexistent.txt", openFile, "nonexistent.txt")  -- Should pass: filename in message
end

-- =======================================
-- assertErrorMsgMatches tests
-- =======================================
-- NOTE: assertErrorMsgMatches requires the pattern to match the COMPLETE error message,
-- which includes file name and line number information. This makes it difficult to use
-- in practice. Most patterns need to account for the full error format.

function testAssertErrorMsgMatchesCompleteMessage()
    lu.assertErrorMsgMatches(".*Simple error message", throwSimpleError)  -- Should pass: pattern matches complete message
end

function testAssertErrorMsgMatchesWithFileInfo()
    lu.assertErrorMsgMatches(".*Division by zero not allowed", throwDivisionByZeroError)  -- Should pass: accounts for file info
end

function testAssertErrorMsgMatchesAnyMessage()
    lu.assertErrorMsgMatches(".*", throwSimpleError)  -- Should pass: matches any complete message
end

function testAssertErrorMsgMatchesEmptyErrorComplete()
    lu.assertErrorMsgMatches(".*", throwEmptyError)  -- Should pass: matches empty error with file info
end

function testAssertErrorMsgMatchesFilePatternComplete()
    lu.assertErrorMsgMatches(".*File not found: config%.txt", throwFileNotFoundError)  -- Should pass: complete pattern
end

function testAssertErrorMsgMatchesDivisionPatternComplete()
    lu.assertErrorMsgMatches(".*Division.*zero.*not allowed", throwDivisionByZeroError)  -- Should pass: flexible pattern
end

function testAssertErrorMsgMatchesWithArgsComplete()
    lu.assertErrorMsgMatches(".*Cannot divide by zero", divideByZero, 5, 0)  -- Should pass: accounts for file info
end

function testAssertErrorMsgMatchesValidateAgeComplete()
    lu.assertErrorMsgMatches(".*Age must be a number.*", validateAge, "string")  -- Should pass: flexible pattern
end

function testAssertErrorMsgMatchesOpenFileComplete()
    lu.assertErrorMsgMatches(".*Filename cannot be nil", openFile, nil)  -- Should pass: accounts for file info
end

function testAssertErrorMsgMatchesNumberErrorComplete()
    lu.assertErrorMsgMatches(".*42.*", throwNumberError)  -- Should pass: number error with file info
end

function testAssertErrorMsgMatchesPartialPattern()
    lu.assertErrorMsgMatches("Simple error message", throwSimpleError)  -- Should fail: doesn't account for file info
end

function testAssertErrorMsgMatchesExactPattern()
    lu.assertErrorMsgMatches("^Simple error message$", throwSimpleError)  -- Should fail: too restrictive
end

function testAssertErrorMsgMatchesWrongPattern()
    lu.assertErrorMsgMatches(".*xyz123.*", throwSimpleError)  -- Should fail: pattern doesn't match content
end

function testAssertErrorMsgMatchesNoError()
    lu.assertErrorMsgMatches(".*", returnZero)  -- Should fail: function doesn't throw error
end

function testAssertErrorMsgMatchesSuccessfulFunction()
    lu.assertErrorMsgMatches(".*", openFile, "valid.txt")  -- Should fail: function succeeds, no error
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
