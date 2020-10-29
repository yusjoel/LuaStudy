--[[
    算术运算符
    A 的值为10，B 的值为 20：
    +	加法	A + B 输出结果 30
    -	减法	A - B 输出结果 -10
    *	乘法	A * B 输出结果 200
    /	除法	B / A w输出结果 2
    %	取余	B % A 输出结果 0
    ^	乘幂	A^2 输出结果 100
    -	负号	-A 输出结果 -10
]]


--[[
    关系运算符
    ==	等于，检测两个值是否相等，相等返回 true，否则返回 false	            (A == B) 为 false。
    ~=	不等于，检测两个值是否相等，不相等返回 true，否则返回 false	        (A ~= B) 为 true。
    >	大于，如果左边的值大于右边的值，返回 true，否则返回 false	        (A > B) 为 false。
    <	小于，如果左边的值大于右边的值，返回 false，否则返回 true	        (A < B) 为 true。
    >=	大于等于，如果左边的值大于等于右边的值，返回 true，否则返回 false    (A >= B) 返回 false。
    <=	小于等于， 如果左边的值小于等于右边的值，返回 true，否则返回 false	 (A <= B) 返回 true。 
]]

--[[
    逻辑运算符
    and	逻辑与操作符。 若 A 为 false，则返回 A，否则返回 B。	            (A and B) 为 false。
    or	逻辑或操作符。 若 A 为 true，则返回 A，否则返回 B。	                (A or B) 为 true。
    not	逻辑非操作符。与逻辑运算结果相反，如果条件为 true，逻辑非为 false。	  not(A and B) 为 true。
]]

-- 请注意 and 与 or 的定义
local a, b = 1, 2
print('a and b', a and b)
-- 2 (b)
print('a or b', a or b)
-- 1 (a)
print('a > b and a or b', a > b and a or b)
-- 2 (相当于 a > b ? a : b)

-- A and B or C 并不等于 A ? B : C
-- 当B为false时, 结果总为C
a, b = nil, 3
print('a ~= b and a or b', a ~= b and a or b)
-- 3

-- (a and {b} or {c})[1]
print('(a ~= b and {a} or {b})[0]', (a ~= b and {a} or {b})[0])
-- nil

--[[
    其他运算符
    ..	连接两个字符串	                        a..b ，其中 a 为 "Hello " ， b 为 "World", 输出结果为 "Hello World"。
    #	一元运算符，返回字符串或表的长度。	      #"Hello" 返回 5
]]

-- table t 的长度被定义成一个整数下标 n 。 它满足 t[n] 不是 nil 而 t[n+1] 为 nil
-- 如果数组中有nil, 那么返回值会出现随机的情况
-- 代码 luaH_getn (Table *t)
-- 参考文章: https://www.cnblogs.com/wallini/p/4188499.html
print()
print('#')
local array1 = {1, 2, 3}
local array2 = {1, 2, three = 3}
local array3 = {1, 2}
array3[4] = 4
local array4 = {1, 2}
array4[5] = 5
local array5 = {1, 2, nil, nil, 5}

print(#array1, #array2, #array3, #array4, #array5)
-- 3    2   4   2   5

--[[
    运算符优先级
    ^
    not    - (unary)
    *      /       %
    +      -
    ..
    <      >      <=     >=     ~=     ==
    and
    or

    除了 ^ 和 .. 外所有的二元运算符都是左连接的。
]]

