-- 多重返回值
-- 例子
local startIndex, endIndex = string.find('Hello Lua users', 'Lua')
print(startIndex, endIndex)

-- 编写
local function maximum(array)
    local index = 1
    local max = array[index]
    for i, value in ipairs(array) do
        if value > max then
            index = i
            max = value
        end
    end

    return max, index
end

print(maximum{1, 2, 3, 4, 5, 10, 9, 8, 7, 6})

-- 只有当一个函数调用是一系列表达式中的最后一个元素时, 才能获得所有返回值, 否则值保留第一个返回值
-- 包括4中情况
--      多重赋值
--      实参列表
--      表构造式
--      return
local array = {1, 2, 3}
local max, index, total = maximum(array), #array
print(max, index, total)

local function foo(max, index, total)
    print(max, index, total)
end
foo(maximum(array), #array)

local t = {maximum(array), #array}
for i, value in ipairs(t) do
    print(i, value)
end

local function bar()
    return maximum(array), #array
end
max, index, total = bar()
print(max, index, total)

-- 可以将函数调用放在一对圆括号内, 迫使它只返回一个结果
max, index = (maximum(array))
print(max, index)

-- unpack (<= 5.1)
-- table.unpack (> 5.1)
-- table.unpack(list: table [, i: 1 [, j: integer]])
-- 接受一个数组作为参数, 并从下标1开始返回所有元素
print(table.unpack(array))

-- 泛型调用 (generic call)
local function gcall(func, parameters)
    return func(table.unpack(parameters))
end

startIndex, endIndex = gcall(string.find, {'Hello Lua user', 'user'})
print(startIndex, endIndex)

-- unpack可以用Lua实现
local function unpack(array, start)
    start = start or 1
    if array[start] then
        return array[start], unpack(array, start + 1)
    end
end

print(unpack(array))
