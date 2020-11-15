-- __index和__newindex都是在表中没有所需访问的索引时才会被调用
-- 只有将一个表保持为空, 才能捕捉到所有对它的访问
local index = {} -- 当成唯一关键字用
local mt = {
    __index = function(t, k)
        print("*access to element " .. tostring(k))
        return t[index][k] -- access the original table
    end,
    __newindex = function(t, k, v)
        print("*update of element " .. tostring(k) .. " to " .. tostring(v))
        t[index][k] = v -- update original table
    end
}

local function track(t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end

local t = track {'a', 'b'}
print(t[1])
t[3] = 'c'

-- 这个方式的缺点是无法使用pairs
for key, value in pairs(t) do
    print(key, value)
end
