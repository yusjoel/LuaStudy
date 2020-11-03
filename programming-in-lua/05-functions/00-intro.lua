--[[
    函数

    函数是对语句和表达式的抽象
        没有返回值: 语句
        有返回值: 表达式

    参数
        参数要放到一对圆括号内
        没有参数也要保留圆括号
        如果只有一个函数, 并且这个函数是字面字符串或者是表构造式, 那么可以省略圆括号

    冒号操作符
        为面对对象式的调用提供了特殊的语法
        o.foo(o, x) => o:foo(x)

    函数包括
        名称(name)
        形式参数(parameters)
        函数体(body)

    形式参数(parameters) = 实际参数(arguments)
        采用多重赋值(multiple assignment)的规则
]]

-- 省略圆括号的情况
print 'literal string'
for key, value in pairs {x = 1, y = 2} do
    print(key, value)
end

-- 参数的默认值
local count = 0
local function incCount(n)
    n = n or 1
    count = count + n
end

incCount()
print(count)

incCount(2)
print(count)
