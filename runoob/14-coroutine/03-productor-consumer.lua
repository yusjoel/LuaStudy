local newProductor

local function send(x)
    coroutine.yield(x)
end

local function receive()
    local status, value = coroutine.resume(newProductor)
    return value
end

local function productor()
    local i = 0
    while true do
        i = i + 1
        send(i)
    end
end

local function consumer()
    while true do
        local i = receive()
        print(i)
    end
end

-- 启动程序
newProductor = coroutine.create(productor)
consumer()
