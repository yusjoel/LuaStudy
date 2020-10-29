-- break
for i = 1, 10 do
    for j = 1, 10 do
        if i < j then
            break
        end
        print(i .. ' x ' .. j .. ' = ' .. i * j)
    end
    if i == 9 then
        break
    end
end

-- goto
--[[
    goto的语法
    goto Label

    Label的语法
    ::Label::
]]

print()
print('goto 1')
local n = 0;
local i = 1;

::Start::
n = n + i;
i = i + 1;
if i <= 10 then
    goto Start
end

print(n)
-- 55

-- continue
-- Lua没有continue, 可以使用goto代替
-- goto也可以跨循环, 很灵活, 但也是灾难的源头
print()
print('continue: goto')
for l = 1, 9 do
    for m = 1, 9 do
        if l > m then
            -- 无法单独对goto指令下断点, 需要另外增加一条命令
            -- print('continue')
            goto continue
        end

        if l * m > 50 then
            -- 执行到以下数值结束内层循环
            -- 6 x 9 = 54
            -- 7 x 8 = 56
            goto next
        end

        if l + m > 15 then
            -- 执行到8 x 8结束双层循环
            goto finish
        end

        print(l .. ' x ' .. m .. ' = ' .. l * m)
        ::continue::
    end
    ::next::
end
::finish::

-- continue
-- 使用 repeat .. until true
print()
print('continue: repeat .. until true')
for i1 = 1, 10 do
    repeat
        if i1 % 2 == 0 then
            break;
        end
        print(i1)
    until true
end
