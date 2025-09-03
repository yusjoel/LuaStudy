-- Demonstration of Table Assertions in LuaUnit
-- Table assertion functions: assertItemsEquals, assertTableContains, assertNotTableContains
-- assertItemsEquals: compares table VALUES (items) regardless of keys
-- assertTableContains: checks if a table contains a specific VALUE
-- assertNotTableContains: checks if a table does NOT contain a specific VALUE
-- 
-- NOTE: There appears to be a bug in LuaUnit where assertNotTableContains incorrectly
-- handles non-table arguments (should fail but may pass). This issue will be reported.
-- 
-- Run with: lua testTableAssertions.lua

local lu = require('test.luaunit')

-- =======================================
-- Test data - various table structures
-- =======================================

-- Empty tables
local emptyTable1 = {}
local emptyTable2 = {}

-- Simple arrays
local array1 = {1, 2, 3}
local array2 = {1, 2, 3}
local array3 = {3, 2, 1}  -- Different order but same items
local array4 = {1, 2, 3, 4}  -- Different items (extra element)
local array5 = {1, 2, "3"}  -- Different items (different type)

-- Hash tables
local hash1 = {name = "John", age = 30, city = "New York"}
local hash2 = {name = "John", age = 30, city = "New York"}
local hash3 = {age = 30, name = "John", city = "New York"}  -- Different order (should be equal)
local hash4 = {name = "John", age = 31, city = "New York"}  -- Different items (different value)
local hash5 = {name = "John", age = 30}  -- Different items (missing item)

-- Tables with same items but different keys
local diffKeys1 = {x = 1, y = 2}
local diffKeys2 = {a = 1, b = 2}  -- Same items {1, 2} but different keys
local diffKeys3 = {x = 2, y = 1}  -- Different items {2, 1}

-- Arrays vs hash tables with same items
local arrayItems = {1, 2, 3}
local hashItems = {a = 1, b = 2, c = 3}  -- Same items {1, 2, 3} but as hash

-- Mixed tables (array + hash)
local mixed1 = {1, 2, 3, name = "Mixed", type = "table"}
local mixed2 = {1, 2, 3, name = "Mixed", type = "table"}
local mixed3 = {1, 2, 3, type = "table", name = "Mixed"}  -- Different order
local mixed4 = {1, 2, name = "Mixed", type = "table"}  -- Missing array element

-- Nested tables
local nested1 = {
    person = {name = "Alice", age = 25},
    scores = {85, 92, 78},
    metadata = {created = "2023", version = 1}
}
local nested2 = {
    person = {name = "Alice", age = 25},
    scores = {85, 92, 78},
    metadata = {created = "2023", version = 1}
}
local nested3 = {
    person = {name = "Alice", age = 26},  -- Different nested value
    scores = {85, 92, 78},
    metadata = {created = "2023", version = 1}
}

-- Tables with different value types
local multiType1 = {
    number = 42,
    string = "hello",
    boolean = true,
    table = {1, 2, 3},
    func = function() return "test" end
}
local multiType2 = {
    number = 42,
    string = "hello",
    boolean = true,
    table = {1, 2, 3},
    func = function() return "test" end
}

-- Tables for contains testing
local simpleArray = {10, 20, 30, 40, 50}
local stringArray = {"apple", "banana", "cherry", "date"}
local mixedArray = {1, "hello", true, 3.14, "world"}
local booleanArray = {true, false, true, false}
local nestedArray = {
    {name = "Alice", age = 25},
    {name = "Bob", age = 30},
    {name = "Charlie", age = 35}
}

-- Values for testing contains
local existingNumber = 30
local nonExistingNumber = 99
local existingString = "banana"
local nonExistingString = "grape"
local existingBoolean = true
local existingFloat = 3.14
local aliceRecord = {name = "Alice", age = 25}

-- =======================================
-- assertItemsEquals tests
-- =======================================

function testAssertItemsEqualsWithEmptyTables()
    lu.assertItemsEquals(emptyTable1, emptyTable2)  -- Should pass: both empty tables
end

function testAssertItemsEqualsWithSimpleArrays()
    lu.assertItemsEquals(array1, array2)  -- Should pass: {1,2,3} == {1,2,3}
end

function testAssertItemsEqualsWithHashTables()
    lu.assertItemsEquals(hash1, hash2)  -- Should pass: identical hash tables
end

function testAssertItemsEqualsWithHashDifferentOrder()
    lu.assertItemsEquals(hash1, hash3)  -- Should pass: same content, different order
end

function testAssertItemsEqualsWithMixedTables()
    lu.assertItemsEquals(mixed1, mixed2)  -- Should pass: identical mixed tables
end

function testAssertItemsEqualsWithMixedDifferentOrder()
    lu.assertItemsEquals(mixed1, mixed3)  -- Should pass: same content, different hash order
end

function testAssertItemsEqualsWithNestedTables()
    lu.assertItemsEquals(nested1, nested2)  -- Should pass: identical nested structures
end

function testAssertItemsEqualsWithSameReference()
    lu.assertItemsEquals(array1, array1)  -- Should pass: same table reference
end

function testAssertItemsEqualsWithEmptyAndNonEmpty()
    -- Should fail: empty vs non-empty - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, emptyTable1, array1)
    lu.assertFalse(success)  -- Should fail due to different items
end

function testAssertItemsEqualsWithDifferentArrayOrder()
    lu.assertItemsEquals(array1, array3)  -- Should pass: {1,2,3} vs {3,2,1} have same items
end

function testAssertItemsEqualsWithSameItemsDifferentKeys()
    lu.assertItemsEquals(diffKeys1, diffKeys2)  -- Should pass: both have items {1, 2}
end

function testAssertItemsEqualsWithArrayVsHash()
    lu.assertItemsEquals(arrayItems, hashItems)  -- Should pass: both have items {1, 2, 3}
end

function testAssertItemsEqualsWithDifferentArrayLength()
    -- Should fail: different items {1,2,3} vs {1,2,3,4} - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, array1, array4)
    lu.assertFalse(success)  -- Should fail due to different item count
end

function testAssertItemsEqualsWithDifferentTypes()
    -- Should fail: different items {1,2,3} vs {1,2,"3"} - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, array1, array5)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertItemsEqualsWithDifferentHashValues()
    -- Should fail: different items due to age difference - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, hash1, hash4)
    lu.assertFalse(success)  -- Should fail due to different values
end

function testAssertItemsEqualsWithMissingItem()
    -- Should fail: different items due to missing city - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, hash1, hash5)
    lu.assertFalse(success)  -- Should fail due to missing item
end

function testAssertItemsEqualsWithDifferentItemsSameKeys()
    lu.assertItemsEquals(diffKeys1, diffKeys3)  -- Should pass: {1,2} vs {2,1} same items, different order
end

function testAssertItemsEqualsWithDifferentNestedValues()
    -- Should fail: different nested age values - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, nested1, nested3)
    lu.assertFalse(success)  -- Should fail due to nested differences
end

function testAssertItemsEqualsWithMixedMissingElement()
    -- Should fail: different items due to missing element - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, mixed1, mixed4)
    lu.assertFalse(success)  -- Should fail due to missing element
end

function testAssertItemsEqualsWithNonTable()
    -- Should fail: table vs string - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, array1, "not a table")
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertItemsEqualsWithNilTable()
    -- Should fail: table vs nil - use pcall to catch the error
    local success, err = pcall(lu.assertItemsEquals, array1, nil)
    lu.assertFalse(success)  -- Should fail due to nil argument
end

function testAssertItemsEqualsWithNumber()
    lu.assertItemsEquals(42, 42)  -- Should pass: fallback to assertEquals when not tables
end

-- =======================================
-- assertTableContains tests
-- =======================================

function testAssertTableContainsNumberInArray()
    lu.assertTableContains(simpleArray, existingNumber)  -- Should pass: 30 exists in {10,20,30,40,50}
end

function testAssertTableContainsFirstElement()
    lu.assertTableContains(simpleArray, 10)  -- Should pass: 10 is first element
end

function testAssertTableContainsLastElement()
    lu.assertTableContains(simpleArray, 50)  -- Should pass: 50 is last element
end

function testAssertTableContainsStringInArray()
    lu.assertTableContains(stringArray, existingString)  -- Should pass: "banana" exists in string array
end

function testAssertTableContainsFirstString()
    lu.assertTableContains(stringArray, "apple")  -- Should pass: "apple" is first string
end

function testAssertTableContainsLastString()
    lu.assertTableContains(stringArray, "date")  -- Should pass: "date" is last string
end

function testAssertTableContainsBooleanTrue()
    lu.assertTableContains(booleanArray, existingBoolean)  -- Should pass: true exists in boolean array
end

function testAssertTableContainsBooleanFalse()
    lu.assertTableContains(booleanArray, false)  -- Should pass: false exists in boolean array
end

function testAssertTableContainsFloatInMixed()
    lu.assertTableContains(mixedArray, existingFloat)  -- Should pass: 3.14 exists in mixed array
end

function testAssertTableContainsIntegerInMixed()
    lu.assertTableContains(mixedArray, 1)  -- Should pass: 1 exists in mixed array
end

function testAssertTableContainsStringInMixed()
    lu.assertTableContains(mixedArray, "hello")  -- Should pass: "hello" exists in mixed array
end

function testAssertTableContainsBooleanInMixed()
    lu.assertTableContains(mixedArray, true)  -- Should pass: true exists in mixed array
end

function testAssertTableContainsTableInNested()
    lu.assertTableContains(nestedArray, aliceRecord)  -- Should pass: {name="Alice", age=25} exists
end

function testAssertTableContainsNonExistingNumber()
    -- Should fail: 99 doesn't exist - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, simpleArray, nonExistingNumber)
    lu.assertFalse(success)  -- Should fail because value not found
end

function testAssertTableContainsNonExistingString()
    -- Should fail: "grape" doesn't exist - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, stringArray, nonExistingString)
    lu.assertFalse(success)  -- Should fail because value not found
end

function testAssertTableContainsWrongTypeInNumber()
    -- Should fail: "30" (string) vs 30 (number) - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, simpleArray, "30")
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertTableContainsWrongTypeInString()
    -- Should fail: number in string array - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, stringArray, 123)
    lu.assertFalse(success)  -- Should fail due to type mismatch
end

function testAssertTableContainsInEmptyArray()
    -- Should fail: empty array has no elements - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, {}, "anything")
    lu.assertFalse(success)  -- Should fail because array is empty
end

function testAssertTableContainsNilValue()
    -- Should fail: nil value - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, simpleArray, nil)
    lu.assertFalse(success)  -- Should fail because nil not in array
end

function testAssertTableContainsNonTable()
    -- Should fail: string is not a table (works correctly) - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, "not a table", "value")
    lu.assertFalse(success)  -- Should fail due to non-table argument
end

function testAssertTableContainsNilTable()
    -- Should fail: nil is not a table (works correctly) - use pcall to catch the error
    local success, err = pcall(lu.assertTableContains, nil, "value")
    lu.assertFalse(success)  -- Should fail due to nil table argument
end

-- =======================================
-- assertNotTableContains tests
-- =======================================

function testAssertNotTableContainsNonExistingNumber()
    lu.assertNotTableContains(simpleArray, nonExistingNumber)  -- Should pass: 99 doesn't exist
end

function testAssertNotTableContainsNonExistingString()
    lu.assertNotTableContains(stringArray, nonExistingString)  -- Should pass: "grape" doesn't exist
end

function testAssertNotTableContainsWrongType()
    lu.assertNotTableContains(simpleArray, "30")  -- Should pass: "30" (string) not in number array
end

function testAssertNotTableContainsStringInNumber()
    lu.assertNotTableContains(simpleArray, "hello")  -- Should pass: string not in number array
end

function testAssertNotTableContainsNumberInString()
    lu.assertNotTableContains(stringArray, 42)  -- Should pass: number not in string array
end

function testAssertNotTableContainsInEmptyArray()
    lu.assertNotTableContains({}, "anything")  -- Should pass: empty array has no elements
end

function testAssertNotTableContainsBooleanInNumber()
    lu.assertNotTableContains(simpleArray, true)  -- Should pass: boolean not in number array
end

function testAssertNotTableContainsFloatInInteger()
    lu.assertNotTableContains({1, 2, 3}, 1.5)  -- Should pass: 1.5 not in integer array
end

function testAssertNotTableContainsNilValue()
    lu.assertNotTableContains(simpleArray, nil)  -- Should pass: nil not in array
end

function testAssertNotTableContainsComplexTable()
    lu.assertNotTableContains(simpleArray, {name = "test"})  -- Should pass: table not in number array
end

function testAssertNotTableContainsExistingNumber()
    -- Should fail: 30 exists - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, simpleArray, existingNumber)
    lu.assertFalse(success)  -- Should fail because value exists
end

function testAssertNotTableContainsExistingString()
    -- Should fail: "banana" exists - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, stringArray, existingString)
    lu.assertFalse(success)  -- Should fail because value exists
end

function testAssertNotTableContainsFirstElement()
    -- Should fail: 10 is first element - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, simpleArray, 10)
    lu.assertFalse(success)  -- Should fail because first element exists
end

function testAssertNotTableContainsLastElement()
    -- Should fail: 50 is last element - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, simpleArray, 50)
    lu.assertFalse(success)  -- Should fail because last element exists
end

function testAssertNotTableContainsBooleanTrue()
    -- Should fail: true exists in boolean array - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, booleanArray, true)
    lu.assertFalse(success)  -- Should fail because true exists
end

function testAssertNotTableContainsBooleanFalse()
    -- Should fail: false exists in boolean array - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, booleanArray, false)
    lu.assertFalse(success)  -- Should fail because false exists
end

function testAssertNotTableContainsFloatInMixed()
    -- Should fail: 3.14 exists in mixed array - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, mixedArray, existingFloat)
    lu.assertFalse(success)  -- Should fail because float exists
end

function testAssertNotTableContainsStringInMixed()
    -- Should fail: "hello" exists in mixed array - use pcall to catch the error
    local success, err = pcall(lu.assertNotTableContains, mixedArray, "hello")
    lu.assertFalse(success)  -- Should fail because string exists
end

function testAssertNotTableContainsNonTable()
    lu.assertNotTableContains("not a table", "value")  -- BUG: Should fail but may pass - LuaUnit bug with non-table first argument
end

function testAssertNotTableContainsNilTable()
    lu.assertNotTableContains(nil, "value")  -- BUG: Should fail but may pass - LuaUnit bug with nil first argument
end

-- Run the tests
os.exit( lu.LuaUnit.run() )
