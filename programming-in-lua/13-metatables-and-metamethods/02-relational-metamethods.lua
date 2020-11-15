-- 关系元方法
-- __eq, __lt, __le
-- Lua 4.0之前, 只存在__lt(<), 不存在__le(<=)
-- a <= b 会被转换成 not (b < a)
-- 但是对于NaN而言, 上式并不成立, 因为任何涉及NaN的比较都应返回false
-- 对于集合, 如果要使用 a < b 来表示a包含于b, 那么显然 a <= b 与 not (b < a) 并不等价
Set = {}
local mt = {}

mt.__le = function(a, b) -- set containment
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

mt.__lt = function(a, b)
    return a <= b and not (b <= a)
end

mt.__eq = function(a, b)
    return a <= b and b <= a
end

mt.__mul = function(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

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

function Set.print(s)
    print(Set.tostring(s))
end

print "test 1"
local s1 = Set.new {2, 4}
local s2 = Set.new {4, 10, 2}
print(s1 <= s2) -- > true
print(s1 < s2) -- > true
print(s1 >= s1) -- > true
print(s1 > s1) -- > false
print(s1 == s2 * s1) -- > true


print "\ntest 2"
-- 如果试图对两个不同类型的值做顺序性比较, Lua会引发一个错误
-- error
-- print(2 > '1')

-- 对两个不同类型的值做相等性比较, 则会返回false
print(10 == '10')

-- 只有当两个比较对象共享一个元方法时, Lua才会调用这个方法
