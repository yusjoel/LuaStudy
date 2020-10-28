--[[
    while(condition)
    do
        statements
    end
]]

local i = 0;
local n = 0;
while i < 10 do
    n = n + i + 1
    i = i + 1
end

print(n)
-- 55

--[[
   for var=exp1,exp2,exp3 do  
      statements
   end 
]]
local table = {}
for i = 1, 10 do
    print(i .. ' x ' .. i .. ' = ' .. i * i)
end

-- 表达式exp1, exp2, exp3在循环开始前一次性求值
