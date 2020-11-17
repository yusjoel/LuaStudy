-- 如何防止未声明的全局变量被使用
-- 方案一, 设置_G的元表, 使用rawset来声明全局变量
setmetatable(_G, {
    __newindex = function(_, n)
        error("attempt to write to undeclared variable " .. n, 2)
    end,
    __index = function(_, n)
        error("attempt to read undeclared variable " .. n, 2)
    end
})

local function declare(name, initval)
    rawset(_G, name, initval or false)
end

-- error
-- A = 1
-- print(A)

declare('A', 0)
A = 1
print(A)

-- 方案二, 只允许主程序块和C程序进行声明
setmetatable(_G, {
    __newindex = function(t, n, v)
        local w = debug.getinfo(2, "S").what
        if w ~= "main" and w ~= "C" then
            error("attempt to write to undeclared variable " .. n, 2)
        end
        rawset(t, n, v)
    end,
    __index = function(_, n)
        error("attempt to read undeclared variable " .. n, 2)
    end
})

A = 1
print(A)
-- error
-- print(B == nil)

-- 测试全局变量是否声明过
local variableName = 'B'
if rawget(_G, variableName) == nil then
    print(variableName, 'undeclared variable')
end

-- 如果要允许全局变量为nil, 可以用一个表记录声明过的变量
local declaredNames = {}

setmetatable(_G, {
    __newindex = function(t, n, v)
        if not declaredNames[n] then
            local w = debug.getinfo(2, "S").what
            if w ~= "main" and w ~= "C" then
                error("attempt to write to undeclared variable " .. n, 2)
            end
            declaredNames[n] = true
        end

        rawset(t, n, v)
    end,
    __index = function(_, n)
        if not declaredNames[n] then
            error("attempt to read undeclared variable " .. n, 2)
        else
            return nil
        end
    end
})

GlobalVariable3 = "AAA"
print(GlobalVariable3)
GlobalVariable3 = nil
print(GlobalVariable3)
GlobalVariable3 = "BBB"
print(GlobalVariable3)

-- strict.lua