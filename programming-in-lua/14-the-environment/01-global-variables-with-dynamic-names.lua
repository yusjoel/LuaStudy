-- 所有的全局变量保存在一个表中, 这个表成为环境(environment)
-- 环境表则保存在全局变量_G中rint
print "environment"
for key, value in pairs(_G) do
    print(key, value)
end

print "\nexamples"
print(_G._G == _G)

GlobalVariable1 = 1
GlobalVariable2 = 's'

local variableName1 = 'GlobalVariable1'
local variableName2 = 'GlobalVariable2'
print(_G[variableName1], _G[variableName2])

-- 可以写成
_G[variableName1] = nil
print(GlobalVariable1)

-- 但不要写成
_G["GlobalVariable1"] = _G["GlobalVariable2"]
print(GlobalVariable1)

-- 实际等价于
-- GlobalVariable1 = GlobalVariable2

local function getfield(f)
    local v = _G -- start with the table of globals
    for w in string.gmatch(f, "[%w_]+") do
        v = v[w]
    end
    return v
end

local function setfield(f, v)
    local t = _G -- start with the table of globals
    for w, d in string.gmatch(f, "([%w_]+)(.?)") do
        if d == "." then -- not last field?
            t[w] = t[w] or {} -- create table if absent
            t = t[w] -- get the table
        else -- last field
            t[w] = v -- do the assignment
        end
    end
end

print "\ngetfield and setfield"
A = { B = { C = { D = 99}}}
print(getfield('A.B.C.D'))
setfield('A.B.C.D', 100)
print(A.B.C.D)