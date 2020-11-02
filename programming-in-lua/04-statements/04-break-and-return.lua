--[[
    break
      结束一个循环, for, repeat或者while
    return
      从一个函数返回

    break/return 必须是end, else或until前的一条语句
]]

for i = 1, 10, 2 do
    if i == 3 then
        print(i)
        -- 可以编译
        break;
        print(i)
    end
end

function Foo(n)
    print('here')
    return n * n
    -- 编译失败
    --print(n * n)
end

function Bar(n)
    print('here')
    do
        -- make Lua happy
        return n * n
    end
    print(n * n)
end

Bar(2)