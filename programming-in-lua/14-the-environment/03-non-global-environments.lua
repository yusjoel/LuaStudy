-- setenv 改变环境 (<= 5.1)
-- >= 5.2, 使用_ENV

local function setfenv(fn, env)
    local i = 1
    while true do
        local name = debug.getupvalue(fn, i)
        if name == "_ENV" then
            debug.upvaluejoin(fn, i, (function()
                return env
            end), 1)
            break
        elseif not name then
            break
        end

        i = i + 1
    end

    return fn
end

local function factory()
    return function()
        return A -- "global" a
    end
end

A = 3
local f1 = factory()
local f2 = factory()
print(f1()) -- > 3
print(f2()) -- > 3
setfenv(f1, {a = 10})
print(f1()) -- > 10
print(f2()) -- > 3
