-- 如何序列化一个字符串
local s = ''

-- 如果字符串中有单引号就会失败
-- 用双引号括住也是同理
io.write("'" .. s .. "'")

-- 同理, 如果字符串中有]]就会失败
io.write("[[" .. s .. "]]")

-- 字符串应该如何保存
-- 使用双引号还是单引号, 还是使用两个方括号?
-- 字符串内可能包含任何字符
-- 甚至还可以注入代码
-- s = ']] .. os.execute("rm *") .. [['

-- 使用[=[ .. ]=], 并且先检查最长的等号长度
local function quote(s)
    local n = -1
    for w in string.gmatch(s, "]=*") do
        n = math.max(n, #w - 1)
    end

    local eq = string.rep("=", n + 1)
    return string.format("[%s[\n%s]%s]", eq, s, eq)
end

-- 最简单的还是用%q
string.format("%q", s)