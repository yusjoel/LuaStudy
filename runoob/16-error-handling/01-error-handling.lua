-- assert(v: any, message: any)
local function add(a, b)
    assert(type(a) == "number", 'a is not a number')
    assert(type(b) == "number", 'b is not a number')
    return a + b
end

--print(add(1))
print(add(2, 3))

--[[
    error(message: any [, level: integer])

    Level=1：[默认]为调用error位置(文件+行号)
    Level=2：指出哪个调用error的函数的函数
    Level=0:不添加错误位置信息
]]
local function divide(a, b)
    if b == 0 then
        error('zero devided')
    end
    return a / b
end

print(divide(2, 4))
--print(divide(2, 0))

--[[
    保护模式(protected mode)

    pcall(f: function [, arg1: any, ...])
    -> success: boolean
    2. result: any
    3. ...
]]

local success, result = pcall(divide, 2, 0)
if success then
    print(result)
else
    print(result)
end

--[[
    带消息处理器(message handler)的pcall

    xpcall(f: function, msgh: function [, arg1: any, ...])
]]
local function messageHandler()
    --debug.debug()
    print(debug.traceback())
end

success, result = xpcall(divide, messageHandler, 2, 0)
if success then
    print(result)
end