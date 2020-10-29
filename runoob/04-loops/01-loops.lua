--[[
    while(condition)
    do
        statements
    end
]] 

local i = 1;
local n = 0;
while i <= 10 do
    n = n + i
    i = i + 1
end

print('while loop')
print(n)
-- 55

--[[
   for var=exp1,exp2,exp3 do
      statements
   end 
]]

print()
print('for loop')
for i1 = 1, 10 do n = n + i1 end

print(n)
-- 110

-- 表达式exp1, exp2, exp3在循环开始前一次性求值
local a = 2
function Square(n) return n * n end

print()
print('for loop 2')
n = 2
for i2 = 1, Square(n) do n = n + i2 end

print(n)
-- 10

-- 在循环内部修改i不会影响到循环次数
-- 虽然编译会通过, 但是诊断会警告
print()
print('for loop 3')
n = 0
for i3 = 1, 10 do
    i3 = i3 + 1
    n = n + i3
end

print(n)
-- 65

--[[
    for key, value in pairs(t) do
        statements
    end
]]
print()
print('for in')
local days = {
    "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
}
for k, v in ipairs(days) do 
    print(k .. ' => ' .. v) 
end

-- pairs vs ipairs
-- pairs遍历表中全部key，value
-- ipairs从下标为1开始遍历，然后下标累加1，如果某个下标元素不存在就终止遍历。
-- 所谓的不存在包括没有设置, 和显式的设置为nil

--[[
    repeat
        statements
    until( condition )
]]

print()
print('repeat')
n = 0
i = 1
repeat
    n = n + i
    i = i + 1
until i > 10
print(n)
-- 55