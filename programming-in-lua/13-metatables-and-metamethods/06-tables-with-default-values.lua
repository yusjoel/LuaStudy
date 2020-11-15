-- 访问表中不存在的字段时, 总是返回nil
-- 如果想要改成0, 可以这样实现
print 'setDefault 1'
local function setDefault1(t, d)
    local mt = {
        __index = function()
            return d
        end
    }
    setmetatable(t, mt)
end
local tab = {x = 10, y = 20}
print(tab.x, tab.z) -- > 10 nil

setDefault1(tab, 0)
print(tab.x, tab.z) -- > 10 0

-- 这个实现的缺点是每次设置都会创建一个新表
-- 一个优化是把这个默认值存放到字段中, 如___
print '\nsetDefault 2'
local mt1 = {
    __index = function(t)
        return t.___
    end
}

local function setDefault2(t, d)
    t.___ = d
    setmetatable(t, mt1)
end

setDefault2(tab, 0)
print(tab.y, tab.w) -- > 20 0

-- 存放在字段中还是不安全, 可能发生冲突
-- 那么用一个新创建的表作为字段名
print '\nsetDefault 3'
local key = {} -- unique key
local mt2 = {
    __index = function(t)
        return t[key]
    end
}
local function setDefault3(t, d)
    t[key] = d
    setmetatable(t, mt2)
end

setDefault3(tab, 1)
print(tab.x, tab.z) -- > 10 1

-- 其他实现方法要使用到弱引用表(Weak Table)
-- 将在第17章讨论