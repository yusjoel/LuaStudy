--[==[
    dofile([filename: string])
    运行Lua代码块
    核心是loadfile

    loadfile ([filename [, mode [, env]]])

    local function dofile(filename)
        local f = assert(loadfile(filename))
        return f();
    end

    loadfile不会引发错误, 只是返回错误
    dofile的assert会引发错误

    如果要多次运行
    更适合调用一次loadfile, 再多次调用它的返回结果

    loadstring (<= 5.1)
    load (chunk [, chunkname [, mode [, env]]])

    load在编译时不涉及词法域, 总是在全局环境中

    Lua将所有的独立程序块视为一个匿名函数的函数体
    该匿名函数具有可变长实参
    function (...)
        <chunk>
    end
]==]

i = 1
local i = 2
local chunk = load('print(i)')
local foo = function ()
    print(i)
end

chunk()
foo()

local sumChunk = [[
    local result = 0
    for _, value in ipairs{...} do
        result = result + value
    end
    return result
]]
local sum = load(sumChunk)
print(sum(1, 2, 3, 4, 5))
