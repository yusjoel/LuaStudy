-- for .. in
--  in 后面表达式应该返回泛型 for 需要的三个值：迭代函数、状态常量、控制变量
--  将状态常量和控制变量作为参数调用迭代函数
local function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount then
        currentNumber = currentNumber + 1
        return currentNumber, currentNumber * currentNumber
    end
end

-- square, 3, 0 就是 迭代函数、状态常量、控制变量
-- 然后调用
-- 1    1   -- square(3, 0)
-- 2    4   -- square(3, 1)
-- 3    9   -- square(3, 2)
-- nil      -- square(3, 3)
print('squre')
for i, n in square, 3, 0 do
    print(i, n)
end

-- ipairs 也是如此
local function iter(a, i)
    i = i + 1
    local v = a[i]
    if v then return i, v end
end

local function mypairs(a)
    return iter, a, 0
end

print('ipairs')
for key, value in mypairs({1, 2, 3}) do
    print(key, value)
end

-- 使用闭包来管理状态常量、控制变量
local function reverseIterator(collection)
    local count = #collection
    local index = count + 1

    return function()
        index = index - 1
        if index >= 0 then
            return collection[index]
        end
    end
end

print('reverse')
for element in reverseIterator({1, 2, 3}) do
    print(element)
end
