-- 当访问table中不存在的字段时, 会查找__index元方法
-- 如果存在__index, 那么由这个元方法来提供最终结果

-- 提供默认值

Window = {} -- create a namespace
-- create the prototype with default values
Window.prototype = {x = 0, y = 0, width = 100, height = 50}
Window.mt = {} -- create a metatable
-- declare the constructor function
function Window.new(o)
    setmetatable(o, Window.mt)
    return o
end

Window.mt.__index = function(table, key)
    return Window.prototype[key]
end

local w1 = Window.new {x = 10, y = 20}
print(w1.width) -- > 100

-- __index 可以直接使用 table
Window.mt.__index = Window.prototype;
local w2 = Window.new {x = 10, y = 20}
print(w2.height) -- > 50

-- 不想涉及__index, 使用rawget
-- rawget并不会加速代码执行
print(rawget(w2, 'height'))
