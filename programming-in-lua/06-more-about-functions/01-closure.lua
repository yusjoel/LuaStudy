
-- 词法域 (Lexical Scoping)
-- 一个函数嵌套在另一个函数中, 内部的函数可以访问外部函数中的变量
-- 这个变量在内部函数中既不是局部变量也不是全局变量, 它被称为
-- 非局部变量 (non-local variable) 或者 upvalue

-- 闭合函数 (closure)
-- 一个函数加上它的非局部变量

print(math.sin(3.1415926))
do
    local oldSin = math.sin
    local degreeToRadian = math.pi / 180
    math.sin = function (degree)
        return oldSin(degree * degreeToRadian)
    end
end

print(math.sin(180))