--[[
    泛型for的语法如下

    for <var-list> in <exp-list> od
        <body>
    end

    var-list
        一个或者多个变量名列表, 用逗号分隔
        第一个变量叫做控制变量, 在循环过程中不会为nil, 当它为nil时循环结束

    exp-list
        一个或多个表达式列表

    泛型for流程
    1. 首先对exp-list求值, 这些表达式应该返回3个值
        迭代器函数
        恒定状态 (invariant value)
        控制变量初值 (control variable)
    2. 以恒定状态和控制变量来调用迭代器函数
    3. 返回值赋予var-list
    4. 如果第一个变量为nil, 循环终止
    5. 否则, 执行循环体, 回到第2步
]]

