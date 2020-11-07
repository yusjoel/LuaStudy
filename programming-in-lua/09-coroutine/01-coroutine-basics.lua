-- coroutine.create(f: function)
--  return thread
local co = coroutine.create(function ()
    print "hi"
end)
print(co)

-- 协同程序创建后处于挂起状态(suspended)
print(coroutine.status(co))

-- coroutine.resume(co: thread [, val1: any, ...])
--   -> success: boolean
--   2. result: any
--   3. ...
-- resume之后, 写成打印hi, 就执行完毕, 状态变为dead
coroutine.resume(co)
print(coroutine.status(co))

-- function coroutine.yield(...)
--     -> ...
co = coroutine.create(function ()
    for i = 1, 10 do
        print(i)
        coroutine.yield()
    end
end)

-- resume之后, 执行到yield为止, 此时状态为suspended
coroutine.resume(co)
print(coroutine.status(co))

for i = 1, 11 do
    -- 一直运行, 直到dead为止
    -- dead之后再运行, 就会返回false, "cannot resume dead coroutine"
    -- resume是在保护模式下运行的
    print(coroutine.resume(co))
end

-- 当协同程序A唤醒另一个协同程序B时, 协同程序A就处于正常状态(normal)
local t = {}
t.a = coroutine.create(function ()
    print("t.a", coroutine.status(t.a))
    print("t.b", coroutine.status(t.b))
    coroutine.resume(t.b)
end)
t.b = coroutine.create(function ()
    print("t.a", coroutine.status(t.a))
    print("t.b", coroutine.status(t.b))
end)

coroutine.resume(t.a)