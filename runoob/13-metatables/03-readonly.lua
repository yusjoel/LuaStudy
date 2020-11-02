-- 首先重载__index, 将取值操作定向到raw
-- 然后重载__newindex, 此时proxy必然是空的, 所以对任何值的设置都会进来, 并且报错
-- 仅仅对raw设置元表, 并重载__newindex是无法达成只读效果的

local function readOnly(raw)
    local proxy = {}
    local mt = {
        __index = raw,
        __newindex = function()
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

local days = readOnly {
    "Sunday", "Monday", "Tuesday", "Wednessday", "Thursday", "Friday", "Saturday"
}

print(days[1])
days[2] = "hello"
