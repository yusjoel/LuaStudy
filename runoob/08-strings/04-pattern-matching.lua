--[[
    模式匹配函数
    string.find, string.gmatch, string.gsub, string.match

    特殊字符
    ^$()%.[]*+-?
]]

--[[
     .: 与任何字符配对
    %a: 与任何字母配对
    %c: 与任何控制符配对(例如\n)
    %d: 与任何数字配对
    %l: 与任何小写字母配对
    %p: 与任何标点(punctuation)配对
    %s: 与空白字符配对
    %u: 与任何大写字母配对
    %w: 与任何字母/数字配对
    %x: 与任何十六进制数配对
    %z: 与任何代表0的字符配对
    %x(此处x是非字母非数字字符): 与字符x配对. 主要用来处理表达式中有功能的字符(^$()%.[]*+-?)的配对问题, 例如%%与%配对
    [数个字符类]: 与任何[]中包含的字符类配对. 例如[%w_]与任何字母/数字, 或下划线符号(_)配对
    [^数个字符类]: 与任何不包含在[]中的字符类配对. 例如[^%s]与任何非空白字符配对

    大写书写时, 表示与非此字符类的任何字符配对. 例如, %S表示与任何非空白字符配对.
]]

--[[
    单个字符类跟一个 '*'， 将匹配零或多个该类的字符。 这个条目总是匹配尽可能长的串；
    单个字符类跟一个 '+'， 将匹配一或更多个该类的字符。 这个条目总是匹配尽可能长的串；
    单个字符类跟一个 '-'， 将匹配零或更多个该类的字符。 和 '*' 不同， 这个条目总是匹配尽可能短的串；
    单个字符类跟一个 '?'， 将匹配零或一个该类的字符。 只要有可能，它会匹配一个；
    %n， 这里的 n 可以从 1 到 9； 这个条目匹配一个等于 n 号捕获物（后面有描述）的子串。
    %bxy，
        这里的 x 和 y 是两个明确的字符； 
        这个条目匹配以 x 开始 y 结束， 且其中 x 和 y 保持 平衡 的字符串。 
        意思是，如果从左到右读这个字符串，对每次读到一个 x 就 +1 ，读到一个 y 就 -1， 最终结束处的那个 y 是第一个记数到 0 的 y。 
        举个例子，条目 %b() 可以匹配到括号平衡的表达式。
    %f[set]，
        指 边境模式；
        这个条目会匹配到一个位于 set 内某个字符之前的一个空串， 且这个位置的前一个字符不属于 set 。
        集合 set 的含义如前面所述。 匹配出的那个空串之开始和结束点的计算就看成该处有个字符 '\0' 一样。
]]

--[[
    ^: 匹配字符串开始处
    $: 匹配字符串结尾处

     如果 '^' 和 '$' 出现在其它位置，它们均没有特殊含义，只表示自身。
]]

--[[
    用小括号括起一个子模式； 这些子模式被称为 捕获物
    捕获物以它们左括号的次序来编号
    空的捕获 () 将捕获到当前字符串的位置（它是一个数字）
]]

-- split
local function split(string, separator)
    if separator == nil then return string end

    local result = {}
    local index = 1
    local pattern = '([^' .. separator .. ']+)'
    for word in string.gmatch(string, pattern) do
        result[index] = word;
        index = index + 1
    end
    return result
end

local substrings = split('Hello Lua user', ' ');
print(substrings[2])
-- Lua

-- trim
local function trim(s)
    -- [?] 这个括号把gsub返回的第二个值取消掉了
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

print(trim('\t\taaa   '))
-- aaa