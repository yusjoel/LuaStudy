
-- 2 * a 的值是返回给resume获得
-- yield 的结果, 也是 return 的值, 则是下一次resume传入的参数
local function foo(a)
    print("foo 函数输出", a)
    return coroutine.yield(2 * a)
end

local co = coroutine.create(function(a, b)
    print("第一次协同程序执行输出", a, b)
    local r = foo(a + 1)

    print("第二次协同程序执行输出", r)
    -- a + b, a - b, 是返回给 resume 的结果
    -- 获得的 x, y 是下一次调用 resume 传入的参数
    local x, y = coroutine.yield(a + b, a - b)

    print("第三次协同程序执行输出", x, y)
    return b, "结束协同程序"
end)

print("main", coroutine.resume(co, 1, 10))
-- 输出 success result
-- main	true	4

print("--分割线----")
print("main", coroutine.resume(co, "r"))
-- main true    11  -9

print("---分割线---")
print("main", coroutine.resume(co, "x", "y"))
-- main true    10  结束协同程序

print("---分割线---")
print("main", coroutine.resume(co, "x", "y"))
-- main false   cannot resume dead coroutine
