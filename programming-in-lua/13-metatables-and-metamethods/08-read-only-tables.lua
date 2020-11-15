-- 实现只读和实现跟踪的方式很类似
-- 只需要让__newindex引发一个错误即可
-- __index也可以直接使用元表来代替函数, 这样效率也更高
-- 缺点是元表必须要新建
local function readOnly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function(t, k, v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

local days = readOnly {
    "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
}
print(days[1]) -- > Sunday
-- days[8] = "Holiday" -- error