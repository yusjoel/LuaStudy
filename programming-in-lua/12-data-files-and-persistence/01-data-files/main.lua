-- 功能上很类似 10.1 数据描述
-- 本节提到:
-- 自从Lua创建之初就把数据描述作为Lua的主要应用之一来考虑,
-- 开发人员为能较快地编译大型程序投入了很多的努力

local path = debug.getinfo(1, "S").source:sub(2):match('^.*/')
local data1 = path .. 'data1.lua'
local data2 = path .. 'data2.lua'

local count = 0
function Entry(_)
    count = count + 1
end
dofile(data1)
print("number of entries: " .. count)

local authors = {}
function Entry(b)
    authors[b[1]] = true
end
dofile(data1)
for name in pairs(authors) do
    print(name)
end

authors = {}
function Entry(b)
    authors[b.author] = true
end
dofile(data2)
for name in pairs(authors) do
    print(name)
end
