-- 变长参数
-- 在函数的定义中, 用3个点(...)表示
-- 访问时也使用3个点, 此时作为表达式来使用
-- 行为类似于一个具有多重返回值的函数
local function sum(...)
    print(...)
    print(..., 1)
    print(2, ...)

    local result = 0
    for _, value in ipairs{...} do
        result = result + value
    end
    return result
end

print(sum(1, 2, 3))
print(sum(1, 2, 3, 4, 5))

-- 追踪某个函数的调用
local function makeTrace(func, name)
    return function  (...)
        print('calling:', name, ...)
        return func(...)
    end
end

sum = makeTrace(sum, 'sum')
sum(1, 3, 5)

-- 使用select获取含有nil的变长参数
local function average(...)
    local count = 0
    local total = 0
    for i = 1, select("#", ...) do
        local arg = select(i, ...)
        if arg then
            total = total + arg
            count = count + 1
        end
    end

    return total / count, total ,count, select("#", ...)
end

print(average(1, nil, 2, nil, nil, 3, 4, nil, 5, nil))