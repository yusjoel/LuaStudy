-- 可以同时对多个变量赋值
print('local a , b = 1, 2')
local a , b = 1, 2
print(a)
print(b)

-- 可以用于交换
print()
print('a, b = b, a')
a, b = b, a
print(a)
print(b)

-- 数量不等的情况
-- a. 变量个数 > 值的个数   按变量个数补足nil
-- b. 变量个数 < 值的个数   多余的值会被忽略
print()
print('local c, d, e = 0')
-- 这里要注意, 只有c被赋值
local c, d, e = 0
print(c)
print(d)
print(e)

-- 赋值在同时发生
-- a, b = a + 1, a + 1 与
-- a = a + 1
-- b = a + 1 不等价
print()
print('a, b = a + 1, a + 1')
a, b = a + 1, a + 1
print(a)
print(b)

-- 函数可以返回多个值
function Foo(n)
    return n + 1, n + 2, n + 3
end

print()
print('local f, g, h = Foo(5)')
local f, g, h = Foo(5)
print(f)
print(g)
print(h)