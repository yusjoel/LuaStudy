--[[
    显式地引发错误
    error(message: any [, level: integer])
    error('error message')
    error({code = 404})

    assert(v: any, message: any) 相当于
    if not v then
        error(message)
    else
        return v
    end
    注意, 调用assert前会对 v 和 message 求值
    如果message是一个复杂的字符串操作要注意不管它是否显示, 实际都是进行求值了

    易于处理的问题, 使用error
    不易于处理的问题, 返回nil和错误信息

    很多函数失败后会返回nil, error_message
    正好和assert配合
]]
