-- 在Lua中, 函数是第一类值（First-Class Value）

-- 定义1, 这里可以使用local
local function factorial(n)
    if n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

print(factorial(5))
-- 120

-- 定义2, 匿名函数赋值, 这里必须global
Fibnacci = function (n)
    if n == 0 then
        return 0
    elseif n == 1 then
        return 1
    elseif n > 1 then
        return Fibnacci(n - 2) + Fibnacci(n - 1)
    end
end

print(Fibnacci(10))
-- 55