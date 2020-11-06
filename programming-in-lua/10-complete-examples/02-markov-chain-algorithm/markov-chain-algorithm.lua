-- 马尔可夫链（Markov Chain, MC）
-- 是一种随机过程, 定义太复杂, 这里只说明一下这里用到的2阶马尔可夫链在做些什么
-- 首先是创建表: statetab
-- 1. 初始状态, 单词1 = \n, 单词2 = \n
-- 2. 读取一个单词, 如果单词读取完毕, 令单词 = \n, 记录 {单词1, 单词2} => 单词
-- 3. 令 单词1 = 单词2, 单词2 = 单词, 如果单词2 ~= \n, 回到第2步
-- 然后根据这个表创建随机语句
-- 1. 初始状态, 单词1 = \n, 单词2 = \n
-- 2. 获取{单词1, 单词2}指向的所有单词, 随机选取其中1个作为下一个单词
-- 3. 令 单词1 = 单词2, 单词2 = 单词, 如果 单词总量 <= MAXGEN, 回到第2步

local function allwords()
    local line = io.read() -- current line
    local pos = 1 -- current position in the line
    return function() -- iterator function
        while line do -- repeat while there are lines
            local s, e = string.find(line, "%w+", pos)
            if s then -- found a word?
                pos = e + 1 -- update next position
                return string.sub(line, s, e) -- return the word
            else
                line = io.read() -- word not found; try next line
                pos = 1 -- restart from first position
            end
        end
        return nil -- no more lines: end of traversal
    end
end

local function prefix(w1, w2)
    return w1 .. " " .. w2
end

local statetab = {}

local function insert(index, value)
    local list = statetab[index]
    if list == nil then
        statetab[index] = {value}
    else
        list[#list + 1] = value
    end
end

local path = debug.getinfo(1, "S").source:sub(2)
local f = io.open(path)
io.input(f)

local MAXGEN = 10000
local NOWORD = "\n"

-- build table
local w1, w2 = NOWORD, NOWORD
for w in allwords() do
    insert(prefix(w1, w2), w)
    w1 = w2;
    w2 = w;
end

insert(prefix(w1, w2), NOWORD)

-- generate text
w1 = NOWORD;
w2 = NOWORD -- reinitialize
for i = 1, MAXGEN do
    local list = statetab[prefix(w1, w2)]
    -- choose a random item from list
    local r = math.random(#list)
    local nextword = list[r]
    if nextword == NOWORD then
        return
    end
    io.write(nextword, " ")
    w1 = w2;
    w2 = nextword
end
