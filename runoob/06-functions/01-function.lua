--[[
    optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
        function_body
        return result_params_comma_separated
    end
]]

-- 执行某个操作
print('hi')

-- 计算并返回值
local function max(a, b)
    if a > b then
        return a
    else
        return b
    end
end

print('max(5, 7) is', max(5, 7))

-- 多返回值
local startIndex, endIndex = string.find('lua', 'u')
print(startIndex, endIndex)
-- 2    2

-- 多返回值与多变量赋值
local si1, ei1, si2, ei2 = string.find('lua', 'u'), string.find('lua', 'a')
print(si1, ei1, si2, ei2)
-- 2    3   3   nil
-- 只有放在所有逗号之后的那个函数会把返回值展开
-- 不要使用这种语法

-- 找到最大值, 返回值与索引
local function maximum (array)
    local index = 1
    local max = -1
    for i, value in ipairs(array) do
        if value > max then
            index = i
            max = value
        end
    end
    return max, index
end

local m, mi = maximum({8,10,23,12,5})
print(m, mi)
-- 23   3

-- 将函数作为参数
local function Foo(n, onError, onSuccess)
    if n < 0 then
        onError('invalid value')
    else
        onSuccess(n * n)
    end
end

Foo(-1, function (message)
    print(message)
end, function (value)
    print('value', value)
end)
-- invalid value

Foo(5, function (message)
    print(message)
end, function (value)
    print('value', value)
end)
-- 25

-- 可变参数
local function add(...)
    local sum = 0
    -- 这里可以省略圆括号, 写成 ipairs{...}
    for key, value in ipairs({...}) do
        sum = sum + value
    end
    return sum
end

local sum1 = add(3, 4, 5, 6, 7)
print(sum1)
-- 25

-- 获取参数数量
local function average(...)
    local args = {...}
    local sum = 0
    for key, value in ipairs(args) do
        sum = sum + value
    end

    -- 这里也可以写成 select("#",...)
    -- return sum / select("#",...)
    return sum / #args
end

-- 变量名和函数名不能重复, 否则会重定义
local n = average(3, 4, 5, 6, 7)
print(n)
-- 5

-- 参数中有nil的情况
print(average(3, 4, 5, nil, 6, 7))
-- 2 = (3 + 4 + 5) / 6

local function average2(...)
    local count = select("#", ...)
    local sum = 0
    for i = 1, count do
        local v = select(i, ...)
        if v then
            sum = sum + v
        end
    end
    return sum / count
end

print(average2(3, 4, 5, nil, 6, 7))
-- 4.1666666666667 = 25 / 6

-- 固定参数 + 可变参数
local function log(format, ...)
    print(string.format(format, ...))
end

log('[Log]Start')
log('[Info]%d, %d', 1, 2)
-- [Log]Start
-- [Info]1, 2

