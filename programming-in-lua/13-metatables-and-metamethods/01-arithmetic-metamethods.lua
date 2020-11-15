-- 算术元方法
-- __add, __sub, __mul, __div, __unm, __mod, __pow, __concat
Set = {}

-- create a new set with the values of the given list
function Set.new(l)
    local set = {}
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.intersection(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.tostring(set)
    local l = {} -- list to put all elements from the set
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

function Set.print(s)
    print(Set.tostring(s))
end

print('Set verison 1')
local s1 = Set.new {1, 2}
local s2 = Set.new {2, 4}
Set.print(Set.union(s1, s2))
Set.print(Set.intersection(s1, s2))

print('\nSet verison 2')
local mt = {} -- metatable for sets
mt.__add = Set.union
mt.__mul = Set.intersection
function Set.new2(l) -- 2nd version
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

local s3 = Set.new2 {1, 3, 5, 7, 9}
local s4 = Set.new2 {2, 3, 5, 7, 11}
Set.print(s3 + s4)
Set.print(s3 * s4)

-- 对于 t1 + t2, Lua会按照如下步骤来检查
-- 1. t1如果有元表, 并且元表有__add, 那么使用该元方法
-- 2. t2如果有元表, 并且元表有__add, 那么使用该元方法
-- 3. 都没有, 引发一个错误
print('\nLooking metamethods')
Set.print(s3 + s1)
Set.print(s2 * s4)
-- error
-- Set.print(s3 + 8)
-- Set.print(s1 + s2)

-- 重新定义union, 加入元表的检查
mt.__add = function(a, b)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attempt to ’add’ a set with a non-set value", 2)
    end
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

-- 下面的代码在没有检查前可以执行, 但是行为不正确
-- 加了检查之后会报错
-- Set.print(s3 + {0, 1, 2, 3, 4})