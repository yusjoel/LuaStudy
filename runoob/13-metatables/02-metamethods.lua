-- 集合
Set = {}
-- 共享的元表
Set.mt = {}

-- new
function Set.new(array)
    local set = {}
    setmetatable(set, Set.mt)
    for _, l in ipairs(array) do
        set[l] = true
    end
    return set
end

-- union, 求并集
function Set.union(a, b)
    local result = Set.new{}
    for i in pairs(a) do
        result[i] = true
    end
    for i in pairs(b) do
        result[i] = true
    end
    return result
end

-- intersection, 求交集
function Set.intersection(a, b)
    local result = Set.new{}
    for i in pairs(a) do
        result[i] = b[i]
    end
    return result
end

-- tostring, 重载原方法tostring
function Set.tostring(set)
    local s = "{"
    local sep = ""
    for i in pairs(set) do
        s = s .. sep .. i
        sep = ","
    end
    return s .. "}"
end

-- print, 打印
function Set.print(set)
    print(Set.tostring(set))
end

-- 重载加运算符为求并
Set.mt.__add = Set.union

-- 重载乘运算符为求交
Set.mt.__mul = Set.intersection

local set1 = Set.new{1, 2}
local set2 = Set.new{3, 4}
local set3 = set1 + set2
local set4 = set3 * set1

Set.print(set1)
Set.print(set2)
Set.print(set3)
Set.print(set4)
