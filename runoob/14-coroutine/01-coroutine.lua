
--[[
-- 拥有独立的堆栈，独立的局部变量，独立的指令指针
-- 同时又与其它协同程序共享全局变量和其它大部分东西。
-- 在任一指定时刻只有一个协同程序在运行，并且这个正在运行的协同程序只有在明确的被要求挂起的时候才会被挂起。

coroutine.create()	    创建 coroutine，返回 coroutine， 参数是一个函数，当和 resume 配合使用的时候就唤醒函数调用
coroutine.resume()	    重启 coroutine，和 create 配合使用
coroutine.yield()	    挂起 coroutine，将 coroutine 设置为挂起状态，这个和 resume 配合使用能有很多有用的效果
coroutine.status()	    查看 coroutine 的状态
                        注：coroutine 的状态有三种：dead，suspended，running，具体什么时候有这样的状态请参考下面的程序
coroutine.wrap()	    创建 coroutine，返回一个函数，一旦你调用这个函数，就进入 coroutine，和 create 功能重复
coroutine.running()	    返回正在跑的 coroutine，一个 coroutine 就是一个线程，当使用running的时候，就是返回一个 corouting 的线程号
]]

-- coroutine.create(f: function)
--   -> coroutine: thread
print('coroutine.create')
local co1 = coroutine.create(function (a, b)
    print(a, b);
    return a + b, a * b
end)
print(co1, type(co1))

-- coroutine.resume(co: thread [, val1: any, ...])
--   -> success: boolean
--   2. result: any
--   3. ...
print('\ncoroutine.resume')
local success, sum, product = coroutine.resume(co1, 7, 8)
print(success, sum, product)

-- coroutine.status(co: thread)
--   -> status: string

-- coroutine.running()
--   -> running_co: thread
--   2. is_main: boolean

-- coroutine.yield(...)
--   -> ...
print('\ncoroutine.yield/status/running')
Co2 = coroutine.create(function ()
    for i = 1, 10 do
        print(i)
        if i == 3 then
            print(coroutine.status(Co2))
            print(coroutine.running())
        end
        coroutine.yield();
    end
end)

coroutine.resume(Co2)
coroutine.resume(Co2)
coroutine.resume(Co2)

print(coroutine.status(Co2))
print(coroutine.running())

-- coroutine.wrap(f: function)
--   -> ...
-- wrap 直接返回一个函数, 可以当成coroutine.resume使用
-- 并且直接返回 result, 没有 success
print('\ncoroutine.wrap')
local wrap = coroutine.wrap(function (a)
    print(a)
    local b, c = coroutine.yield(a * a)

    print(b, c)
    local e, f, g = coroutine.yield(b + c)

    print(e .. f .. g)
    return e, f, g
end)

print(wrap, type(wrap))
print(wrap(9))
print(wrap(3, 5))
print(wrap('Hello', 'Lua', 'user'))
-- cannot resume dead coroutine
-- wrap('dead')