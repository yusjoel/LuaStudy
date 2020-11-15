-- 每个值都有元表, 但是只有字符串默认设置了元表
local n = 1
local s = 's'
print(type(n), getmetatable(n))
print(type(s), getmetatable(s))

local function foo()
    print('function')
end

local co = coroutine.create(foo)

print(type(foo), getmetatable(foo))
print(type(co), getmetatable(co))

-- table和userdata可以有各自独立的元表
-- 新建table时不会创建元表
-- 任何table都可以作为任何值的元表, 甚至可以做自身的元表

local t1 = {}
print(type(t1), getmetatable(t1))

local t2 = {}
setmetatable(t1, t2)
print(type(t1), getmetatable(t1))

