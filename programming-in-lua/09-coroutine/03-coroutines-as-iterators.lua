local function printResult(a)
    for i = 1, #a do
        io.write(a[i], " ")
    end
    io.write("\n")
end

local function permgen(a, n)
    n = n or #a
    if n <= 1 then
        coroutine.yield(a)
    else
        for i = 1, n do
            a[n], a[i] = a[i], a[n]
            permgen(a, n - 1)
            a[n], a[i] = a[i], a[n]
        end
    end
end

local function permutations(a)
    local co = coroutine.create(function()
        permgen(a)
    end)
    return function()
        local _, res = coroutine.resume(co)
        return res
    end
end

-- function coroutine.wrap(f: function)
-- wrap比起resume更易于使用
-- 但是该函数返回的是function, 而不是thread
-- 所以无法检查协同程序的状态, 灵活性不够
local function permutationsWrap(a)
    return coroutine.wrap(function ()
        permgen(a)
    end)
end

for p in permutations({"a", "b", "c"}) do
    printResult(p)
end

print('\ncoroutine.wrap')
for p in permutationsWrap({"c", "b", "a"}) do
    printResult(p)
end
