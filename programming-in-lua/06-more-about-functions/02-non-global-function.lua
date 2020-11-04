-- Lua将程序块(chunk)视为一个函数
-- 程序块中定义的局部函数, 可以被其他函数调用
local foo = function()
    return 1
end

local bar = function()
    print(foo())
end

bar()

--[[
    递归, 此时fact还未定义

    local fact = function(n)
        if n == 0 then
            return 1
        end
        -- 未定义
        return n * fact(n - 1)
    end
]]

local fact
fact = function(n)
    if n == 0 then
        return 1
    end
    return n * fact(n - 1)
end

print(fact(5))

-- 使用语法糖, 会展开成上例中的形式
local function fibnacci(n)
    if n == 1 then
        return 1
    elseif n == 2 then
        return 1
    else
        return fibnacci(n - 1) + fibnacci(n - 2)
    end
end

print(fibnacci(5))

-- 间接递归
local a, b

function a(n)
    b()
end

function b()
    a()
end