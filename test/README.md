# LuaUnit 测试框架


### Visual Studio Code 配置
* 安装 Test Explorer UI
* 安装 Test Adapter Converter
* 安装 Lua Test Adapter
* 配置 settings.json
  `"luaTestAdapter.luaExe": "你的lua.exe完整路径",`

# LuaUnit 断言函数详解

LuaUnit 是 Lua 语言的单元测试框架，提供了丰富的断言函数来验证代码的正确性。本节详细介绍各种断言函数的用法和注意事项。

## 目录

- [基础断言](#基础断言)
- [等值断言](#等值断言)
- [字符串断言](#字符串断言)
- [表断言](#表断言)
- [类型断言](#类型断言)
- [数值断言](#数值断言)
- [科学计算断言](#科学计算断言)
- [错误断言](#错误断言)
- [注意事项](#注意事项)

## 基础断言

### assertTrue(value)
验证值在逻辑上为真。注意：只有 `true` 本身才会通过测试，其他"真值"（如数字、字符串）会失败。

```lua
lu.assertTrue(true)    -- ✓ 通过
lu.assertTrue(1)       -- ✗ 失败：1 不是 true
lu.assertTrue("hello") -- ✗ 失败：字符串不是 true
```

### assertFalse(value)
验证值严格等于 `false`。

```lua
lu.assertFalse(false) -- ✓ 通过
lu.assertFalse(nil)   -- ✗ 失败：nil 不是 false
lu.assertFalse(0)     -- ✗ 失败：0 不是 false
```

### assertEvalToTrue(value)
验证值在 Lua 中被求值为真（即不是 `false` 或 `nil`）。

```lua
lu.assertEvalToTrue(true)      -- ✓ 通过
lu.assertEvalToTrue(1)         -- ✓ 通过
lu.assertEvalToTrue("hello")   -- ✓ 通过
lu.assertEvalToTrue({})        -- ✓ 通过
lu.assertEvalToTrue(false)     -- ✗ 失败
lu.assertEvalToTrue(nil)       -- ✗ 失败
```

### assertEvalToFalse(value)
验证值在 Lua 中被求值为假（即 `false` 或 `nil`）。

```lua
lu.assertEvalToFalse(false) -- ✓ 通过
lu.assertEvalToFalse(nil)   -- ✓ 通过
lu.assertEvalToFalse(0)     -- ✗ 失败：0 求值为真
lu.assertEvalToFalse("")    -- ✗ 失败：空字符串求值为真
```

### assertNil(value)
验证值为 `nil`。

```lua
lu.assertNil(nil)           -- ✓ 通过
lu.assertNil()              -- ✓ 通过：未定义变量
lu.assertNil(false)         -- ✗ 失败
lu.assertNil(0)             -- ✗ 失败
```

### assertNotNil(value)
验证值不为 `nil`。

```lua
lu.assertNotNil(false)  -- ✓ 通过
lu.assertNotNil(0)      -- ✓ 通过
lu.assertNotNil("")     -- ✓ 通过
lu.assertNotNil(nil)    -- ✗ 失败
```

### assertNotTrue(value) / assertNotFalse(value)
验证值不是严格的 `true` 或 `false`。

```lua
lu.assertNotTrue(false)    -- ✓ 通过
lu.assertNotTrue(1)        -- ✓ 通过
lu.assertNotTrue(true)     -- ✗ 失败

lu.assertNotFalse(true)    -- ✓ 通过
lu.assertNotFalse(nil)     -- ✓ 通过
lu.assertNotFalse(false)   -- ✗ 失败
```

## 等值断言

### assertEquals(actual, expected)
验证两个值相等。对于表，会进行深度比较。

```lua
lu.assertEquals(42, 42)                    -- ✓ 通过
lu.assertEquals("hello", "hello")          -- ✓ 通过
lu.assertEquals({1, 2, 3}, {1, 2, 3})     -- ✓ 通过：内容相同
lu.assertEquals(42, "42")                  -- ✗ 失败：类型不同
```

### assertNotEquals(actual, expected)
验证两个值不相等。

```lua
lu.assertNotEquals(42, 43)           -- ✓ 通过
lu.assertNotEquals("hello", "world") -- ✓ 通过
lu.assertNotEquals(42, 42)           -- ✗ 失败
```

### assertAlmostEquals(actual, expected, margin)
验证两个数值在指定误差范围内相等，用于浮点数比较。

```lua
lu.assertAlmostEquals(1.0, 1.0000001, 1e-6)  -- ✓ 通过
lu.assertAlmostEquals(3.14159, 3.14160, 1e-4) -- ✓ 通过
lu.assertAlmostEquals(1.0, 1.1, 1e-6)         -- ✗ 失败：差距太大
```

### assertNotAlmostEquals(actual, expected, margin)
验证两个数值不在指定误差范围内。

```lua
lu.assertNotAlmostEquals(1.0, 1.1, 1e-6)    -- ✓ 通过：差距大于误差
lu.assertNotAlmostEquals(1.0, 1.0000001, 1e-6) -- ✗ 失败：在误差范围内
```

### assertIs(actual, expected)
验证两个值是同一个对象（引用相等）。

```lua
local table1 = {1, 2, 3}
local table2 = table1

lu.assertIs(table1, table2)           -- ✓ 通过：同一引用
lu.assertIs(42, 42)                   -- ✓ 通过：相同数值
lu.assertIs("test", "test")           -- ✓ 通过：字符串驻留
lu.assertIs({1, 2, 3}, {1, 2, 3})    -- ✗ 失败：不同对象
```

### assertNotIs(actual, expected)
验证两个值不是同一个对象。

```lua
lu.assertNotIs({1, 2, 3}, {1, 2, 3})  -- ✓ 通过：不同对象
lu.assertNotIs(42, 42)                -- ✗ 失败：相同数值
```

## 字符串断言

### assertStrContains(str, substring)
验证字符串包含指定子串（区分大小写）。

```lua
lu.assertStrContains("Hello World", "Hello")  -- ✓ 通过
lu.assertStrContains("Hello World", "World")  -- ✓ 通过
lu.assertStrContains("Hello World", "hello")  -- ✗ 失败：大小写敏感
lu.assertStrContains("Hello World", "")       -- ✓ 通过：空串总是包含
```

### assertNotStrContains(str, substring)
验证字符串不包含指定子串。

```lua
lu.assertNotStrContains("Hello World", "xyz")   -- ✓ 通过
lu.assertNotStrContains("Hello World", "hello") -- ✓ 通过：大小写敏感
lu.assertNotStrContains("Hello World", "Hello") -- ✗ 失败
```

### assertStrIContains(str, substring)
验证字符串包含指定子串（不区分大小写）。

```lua
lu.assertStrIContains("Hello World", "hello")  -- ✓ 通过：忽略大小写
lu.assertStrIContains("Hello World", "WORLD")  -- ✓ 通过：忽略大小写
lu.assertStrIContains("Hello World", "xyz")    -- ✗ 失败
```

### assertNotStrIContains(str, substring)
验证字符串不包含指定子串（不区分大小写）。

```lua
lu.assertNotStrIContains("Hello World", "xyz")    -- ✓ 通过
lu.assertNotStrIContains("Hello World", "hello")  -- ✗ 失败：忽略大小写后包含
```

### assertStrMatches(str, pattern)
验证字符串匹配 Lua 模式。**注意：模式必须匹配整个字符串**。

```lua
lu.assertStrMatches("Hello World", "^Hello.*")     -- ✓ 通过：以Hello开头
lu.assertStrMatches("Hello World", ".*World$")     -- ✓ 通过：以World结尾
lu.assertStrMatches("123-456-7890", "%d+%-%d+%-%d+") -- ✓ 通过：电话号码格式
lu.assertStrMatches("Hello World", "Hello")        -- ✗ 失败：只匹配部分
```

**重要提示**：`assertStrMatches` 要求模式匹配整个字符串，而不是部分匹配。如果要匹配子串，需要使用 `.*` 前缀或后缀。

## 表断言

### assertItemsEquals(table1, table2)
比较两个表的**值**（items），忽略键的差异。**当参数不是表时，会回退到 `assertEquals`**。

```lua
lu.assertItemsEquals({1, 2, 3}, {1, 2, 3})      -- ✓ 通过
lu.assertItemsEquals({1, 2, 3}, {3, 2, 1})      -- ✓ 通过：相同项目
lu.assertItemsEquals({a=1, b=2}, {x=1, y=2})    -- ✓ 通过：相同值，不同键
lu.assertItemsEquals(42, 42)                    -- ✓ 通过：回退到assertEquals
lu.assertItemsEquals({1, 2, 3}, {1, 2, 4})     -- ✗ 失败：不同项目
```

### assertTableContains(table, value)
验证表中包含指定值。

```lua
lu.assertTableContains({1, 2, 3}, 2)               -- ✓ 通过
lu.assertTableContains({"apple", "banana"}, "apple") -- ✓ 通过
lu.assertTableContains({1, 2, 3}, "2")             -- ✗ 失败：类型不匹配
lu.assertTableContains({1, 2, 3}, 4)               -- ✗ 失败：不存在
```

### assertNotTableContains(table, value)
验证表中不包含指定值。**注意：当第一个参数不是表时，可能存在 LuaUnit 的 bug**。

```lua
lu.assertNotTableContains({1, 2, 3}, 4)        -- ✓ 通过
lu.assertNotTableContains({1, 2, 3}, "1")      -- ✓ 通过：类型不匹配
lu.assertNotTableContains({1, 2, 3}, 2)        -- ✗ 失败：存在
```

## 类型断言

### assertIsNumber(value) / assertIsString(value) / assertIsTable(value)
验证值的类型。

```lua
lu.assertIsNumber(42)        -- ✓ 通过
lu.assertIsNumber(3.14)      -- ✓ 通过
lu.assertIsNumber(math.huge) -- ✓ 通过：无穷大
lu.assertIsNumber(0/0)       -- ✓ 通过：NaN也是数字

lu.assertIsString("hello")   -- ✓ 通过
lu.assertIsString("")        -- ✓ 通过：空字符串

lu.assertIsTable({})         -- ✓ 通过
lu.assertIsTable({1, 2, 3})  -- ✓ 通过
```

### assertIsBoolean(value) / assertIsNil(value) / assertIsFunction(value)
验证布尔值、nil 和函数类型。

```lua
lu.assertIsBoolean(true)     -- ✓ 通过
lu.assertIsBoolean(false)    -- ✓ 通过

lu.assertIsNil(nil)          -- ✓ 通过

lu.assertIsFunction(print)   -- ✓ 通过：内建函数
lu.assertIsFunction(function() end) -- ✓ 通过：匿名函数
```

### assertIsUserdata(value)
验证用户数据类型（通常是 C 扩展创建的对象）。

```lua
local file = io.open("test.txt", "w")
lu.assertIsUserdata(file)    -- ✓ 通过：文件句柄
file:close()
```

### assertIsThread(value) / assertIsCoroutine(value)
验证线程/协程类型（两个函数功能相同）。

```lua
local co = coroutine.create(function() end)
lu.assertIsThread(co)        -- ✓ 通过
lu.assertIsCoroutine(co)     -- ✓ 通过：同样功能
```

## 数值断言

### assertIsNaN(value)
验证值是 NaN（非数字）。

```lua
lu.assertIsNaN(0/0)          -- ✓ 通过
lu.assertIsNaN(math.sqrt(-1)) -- ✓ 通过
lu.assertIsNaN(42)           -- ✗ 失败：是有效数字
lu.assertIsNaN("NaN")        -- ✗ 失败：是字符串
```

### assertNotIsNaN(value)
验证值不是 NaN。**注意：对于非数字类型可能存在 LuaUnit 的 bug**。

```lua
lu.assertNotIsNaN(42)        -- ✓ 通过
lu.assertNotIsNaN(math.huge) -- ✓ 通过：无穷大不是NaN
lu.assertNotIsNaN(0/0)       -- ✗ 失败：是NaN
```

## 科学计算断言

### assertIsInf(value) / assertIsPlusInf(value) / assertIsMinusInf(value)
验证无穷大值。

```lua
lu.assertIsInf(math.huge)     -- ✓ 通过：正无穷
lu.assertIsInf(-math.huge)    -- ✓ 通过：负无穷
lu.assertIsInf(1/0)           -- ✓ 通过：正无穷

lu.assertIsPlusInf(math.huge) -- ✓ 通过：正无穷
lu.assertIsPlusInf(-math.huge) -- ✗ 失败：是负无穷

lu.assertIsMinusInf(-math.huge) -- ✓ 通过：负无穷
lu.assertIsMinusInf(math.huge)  -- ✗ 失败：是正无穷
```

### assertNotIsInf(value) / assertNotIsPlusInf(value) / assertNotIsMinusInf(value)
验证不是无穷大值。

```lua
lu.assertNotIsInf(42)         -- ✓ 通过
lu.assertNotIsInf(0/0)        -- ✓ 通过：NaN不是无穷
lu.assertNotIsInf(math.huge)  -- ✗ 失败：是无穷
```

### assertIsPlusZero(value) / assertIsMinusZero(value)
验证正零和负零（在某些情况下 Lua 会区分）。

```lua
lu.assertIsPlusZero(0.0)      -- ✓ 通过
lu.assertIsPlusZero(1.0 - 1.0) -- ✓ 通过

lu.assertIsMinusZero(-0.0)    -- ✓ 通过：负零
```

### assertNotIsPlusZero(value) / assertNotIsMinusZero(value)
验证不是正零或负零。

```lua
lu.assertNotIsPlusZero(-0.0)  -- ✓ 通过：是负零
lu.assertNotIsPlusZero(0.0)   -- ✗ 失败：是正零
```

## 错误断言

### assertError(function)
验证函数调用会抛出错误。

```lua
lu.assertError(function() error("test error") end)  -- ✓ 通过
lu.assertError(function() return 1/0 end)           -- ✗ 失败：不抛错误
lu.assertError(function() return 42 end)            -- ✗ 失败：正常返回
```

### assertErrorMsgEquals(expectedMsg, function)
验证函数抛出的错误消息等于期望值。

```lua
lu.assertErrorMsgEquals("division by zero", 
    function() error("division by zero") end)       -- ✓ 通过
    
lu.assertErrorMsgEquals("test", 
    function() error("different message") end)      -- ✗ 失败：消息不匹配
```

### assertErrorMsgContains(expectedSubstring, function)
验证函数抛出的错误消息包含期望的子串。

```lua
lu.assertErrorMsgContains("division", 
    function() error("division by zero error") end) -- ✓ 通过
    
lu.assertErrorMsgContains("xyz", 
    function() error("division by zero") end)       -- ✗ 失败：不包含子串
```

### assertErrorMsgMatches(pattern, function)
验证函数抛出的错误消息匹配指定模式。

```lua
lu.assertErrorMsgMatches(".*division.*", 
    function() error("division by zero") end)       -- ✓ 通过
    
lu.assertErrorMsgMatches("%d+", 
    function() error("error code 404") end)         -- ✓ 通过：包含数字
```

## 注意事项

### 1. 严格性 vs 逻辑性
- `assertTrue`/`assertFalse`：严格相等，只接受 `true`/`false`
- `assertEvalToTrue`/`assertEvalToFalse`：逻辑求值，遵循 Lua 的真值规则

### 2. 字符串匹配
- `assertStrMatches` 要求模式匹配整个字符串，使用 `.*` 进行部分匹配
- 区分大小写的函数和不区分大小写的函数要明确使用场景

### 3. 表比较
- `assertEquals`：深度比较表的结构和内容
- `assertItemsEquals`：只比较值，忽略键的差异
- 当参数不是表时，`assertItemsEquals` 会回退到 `assertEquals`

### 4. 引用 vs 值
- `assertIs`/`assertNotIs`：比较引用（同一对象）
- `assertEquals`/`assertNotEquals`：比较值（内容相等）

### 5. 浮点数比较
- 使用 `assertAlmostEquals` 而不是 `assertEquals` 来比较浮点数
- NaN 和无穷大都被视为数字类型

### 6. 已知的 LuaUnit Bug
- `assertNotIsNaN` 和 `assertNotTableContains` 对于非预期类型的参数可能有异常行为
- 建议在使用前先验证参数类型

### 7. 错误测试模式
对于预期失败的测试，建议使用 pcall 模式：

```lua
-- 推荐的预期失败测试模式
function testExpectedFailure()
    local success, err = pcall(lu.assertEquals, 1, 2)
    lu.assertFalse(success)  -- 验证断言确实失败了
end
```

这种模式确保测试能够验证断言的失败情况，而不会中断整个测试套件的执行。

## 测试文件结构

本项目包含了完整的 LuaUnit 断言测试示例：

- `test/testEqualityAssertions.lua` - 等值断言测试
- `test/testStringAssertions.lua` - 字符串断言测试  
- `test/testTableAssertions.lua` - 表断言测试
- `test/testTypeAssertions.lua` - 类型断言测试
- `test/testValueAssertions.lua` - 值断言测试
- `test/testScientificAssertions.lua` - 科学计算断言测试
- `test/testErrorAssertions.lua` - 错误断言测试

每个测试文件都包含了详细的正面和负面测试用例，可以作为学习和参考的材料。

## 运行测试

要运行所有测试，请使用：

```bash
lua test/test.lua
```

这将执行完整的测试套件，验证所有断言函数的行为。