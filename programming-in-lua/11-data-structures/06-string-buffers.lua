-- 不使用缓冲
local buff = ""
for line in io.lines() do
    buff = buff .. line .. "\n"
end

-- 使用缓冲
do
    local t = {}
    for line in io.lines() do
        t[#t + 1] = line .. "\n"
    end
    local s = table.concat(t)
end

-- 优化行尾的换行
do
    local t = {}
    for line in io.lines() do
        t[#t + 1] = line
    end
    local s = table.concat(t, "\n") .. "\n"
end

-- 优化文件尾的换行
do
    local t = {}
    for line in io.lines() do
        t[#t + 1] = line
    end
    t[#t + 1] = ""
    local s = table.concat(t, "\n")
end

-- table.concat的实现机制
-- 避免大一个大的字符串与小字符串拼接后造成大量的内存复制
-- 基本思路是让大小差不多的字符串进行拼接
-- 算法如下
-- 1. 将字符串压入栈
-- 2. 如果栈顶的字符串长于下面的字符串, 则拼接这两个字符串
-- 3. 重复步骤2, 直到栈顶的字符串短于下面的字符串
-- 4. 当所有的字符串都压入栈后, 从栈顶到栈底拼接所有字符串

local function addString(stack, s)
    stack[#stack + 1] = s -- push ’s’ into the the stack
    for i = #stack - 1, 1, -1 do
        if #stack[i] > #stack[i + 1] then
            break
        end
        stack[i] = stack[i] .. stack[i + 1]
        stack[i + 1] = nil
    end
end
