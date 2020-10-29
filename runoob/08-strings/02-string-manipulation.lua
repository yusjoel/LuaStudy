-- string.upper
print(string.upper('abc'))
-- ABC

-- string.lower
print(string.lower('ABC'))
-- abc

-- string.gsub(mainString,findString,replaceString,num)
print(string.gsub('aaaa', 'a', 'bc', 3))
-- bcbcbca

-- gsub还可以用于正则表达式的查找替换

-- string.find (str, substr, [init, [end]])
-- 返回起始字符索引和结束字符索引, 没有找到返回nil
print(string.find('Hello Lua user', 'Lua'))
-- 7    9

-- string.find 正好和 string.sub 配对
print(string.sub('Hello Lua user', string.find('Hello Lua user', 'L%a+')))
-- Lua

-- string.reverse
print(string.reverse('abc'))
-- cba

-- string.format
-- 详见03-format.lua
print(string.format('a = %d', 1))
-- a = 1

-- string.char
print(string.char(97, 98, 99, 100))
-- abcd

-- string.byte
print(string.byte('abcd'), string.byte('abcd', 4))
-- 97   100

-- string.len
print(string.len('abc'), #'abc', string.len('甲乙丙'), #'甲乙丙')
-- 3    3   9   9

-- string.rep
print(string.rep('abc', 2))
-- abcabc

-- ..

-- string.gmatch(str, pattern)
-- 返回一个迭代器函数, 每执行一次该函数返回一个匹配的字符串
local match = string.gmatch('Hello Lua user', '%a+')
print(match)
-- function: xxxxxxxx

for word in match do
    print(word)
end
-- Hello
-- Lua
-- user

-- string.match(str, pattern, init)
-- 如果有捕获, 返回所有捕获
-- 如果没有设置捕获标记, 返回整个配对字符串
-- 如果没有匹配成功, 返回nil
print(string.match('Hello Lua user', '%a+ %a+'))
-- Hello Lua
print(string.match('Hello Lua user', '(%a+) (%a+)'))
-- Hello    Lua
print(string.match('Hello Lua user', '%d+'))
-- nil

-- string.sub(s, i [, j])
-- 
local rawString = '1234567890'
print(string.sub(rawString, 3))
-- 34567890
print(string.sub(rawString, 2, 5))
-- 2345
print(string.sub(rawString, 2, 20))
-- 234567890
print(string.sub(rawString, -5))
-- 67890
print(string.sub(rawString, -20))
-- 01234567890
