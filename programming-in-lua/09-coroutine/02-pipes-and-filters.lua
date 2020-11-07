do
    local function send(x)
        coroutine.yield(x)
    end

    local producer = coroutine.create(function()
        while true do
            local x = io.read()
            send(x)
            if not x then
                break
            end
        end
    end)

    local function receive()
        local _, value = coroutine.resume(producer)
        return value
    end

    local function consumer()
        while true do
            local x = receive()
            if x then
                print(x)
            else
                break
            end

        end
    end

    local path = debug.getinfo(1, "S").source:sub(2)
    local f = io.open(path)
    io.input(f)

    consumer()
end

do
    local function receive(prod)
        local _, value = coroutine.resume(prod)
        return value
    end

    local function send(x)
        coroutine.yield(x)
    end

    local function producer()
        return coroutine.create(function()
            while true do
                local x = io.read()
                send(x)
                if not x then
                    break
                end
            end
        end)
    end

    local function filter(prod)
        return coroutine.create(function()
            for line = 1, math.huge do
                local x = receive(prod)
                if x then
                    x = string.format("%5d %s", line, x)
                    send(x)
                else
                    send(x)
                    break
                end
            end
        end)
    end

    local function consumer(prod)
        while true do
            local x = receive(prod)
            if x then
                print(x)
            else
                break
            end
        end
    end

    local path = debug.getinfo(1, "S").source:sub(2)
    local f = io.open(path)
    io.input(f)

    consumer(filter(producer()))
end
