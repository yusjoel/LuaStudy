-- __tostring
-- print(value) 会检查该值是否有一个__tostring元方法
-- 如果存在会调用 __tostring(value)

print '__tostring'

Set = {}
local mt = {}

function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.tostring(set)
    local l = {} -- list to put all elements from the set
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

mt.__tostring = Set.tostring

local s1 = Set.new{'a', 'b', 'c'}
print(s1)

-- __metatable
-- 设置了__metatable 之后, 就无法调用setmetatable
print "\nwithout __metatable"
local s2 = Set.new {'x', 'y', 'z'}
print(getmetatable(s2))
setmetatable(s2, nil)
print(s2)

print "\nwith __metatable"
mt.__metatable = 'not your business'
local s3 = Set.new {'a', 'b', 'c'}
print(getmetatable(s3))
-- setmetatable(s3, nil) -- error
print(s3)