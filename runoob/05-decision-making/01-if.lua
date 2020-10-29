--[[
    if(布尔表达式)
    then
        --[ 在布尔表达式为 true 时执行的语句 --]
    end
]]
print('if .. then .. end')
local a = 5
if a > 0 then
    print('a > 0')
end
-- a > 0

a = 0
if a > 0 then
    print('a > 0')
end
-- nothing

-- 0不是false
if a then
    print('a == ' .. a)
end
-- a == 0

--[[
    if(布尔表达式)
    then
        --[ 布尔表达式为 true 时执行该语句块 --]
    else
        --[ 布尔表达式为 false 时执行该语句块 --]
    end
]]
print()
print('if .. then .. else .. end')

local b = 0
if b > 0 then
    print('b > 0')
else
    print('b <= 0')
end
-- b <= 0

--[[
    if( 布尔表达式 1)
    then
        --[ 在布尔表达式 1 为 true 时执行该语句块 --]
    elseif( 布尔表达式 2)
    then
        --[ 在布尔表达式 2 为 true 时执行该语句块 --]
    elseif( 布尔表达式 3)
    then
        --[ 在布尔表达式 3 为 true 时执行该语句块 --]
    else 
        --[ 如果以上布尔表达式都不为 true 则执行该语句块 --]
    end
]]
print()
print('if .. then .. elseif .. then .. else .. end')
local c = 0
if c > 0 then
    print('c > 0')
elseif c < 0 then
    print('c < 0')
else
    print('c == 0')
end
-- c == 0

--[[
    if( 布尔表达式 1)
    then
        --[ 布尔表达式 1 为 true 时执行该语句块 --]
        if(布尔表达式 2)
        then
            --[ 布尔表达式 2 为 true 时执行该语句块 --]
        end
    end
]]
print()
print('if 嵌套')
local d, e = 59, 44
if d >= 60 then
    if e >= 60 then
        print('d及格, e及格')
    else
        print('d及格, e不及格')
    end
else
    if e >= 60 then
        print('d不及格, e及格')
    else
        print('d不及格, e不及格')
    end
end
-- d不及格, e不及格