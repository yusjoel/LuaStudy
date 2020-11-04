-- 函数是匿名的, 函数名只是一个持有某函数的变量

do
    -- 如下的函数定义是一个语法糖
    local function foo()
        return 1
    end
end

do
    -- 实质是一个赋值语句
    -- 等号右侧的表达式是函数的构造式
    local foo = function ()
        return 1
    end
end
