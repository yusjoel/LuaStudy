--[[
    需要在同一时间处理多个文件时, 使用 file:function_name 来代替 io.function_name 方法
]]

local inFile = io.open('lua-format.config', "r")
local outFile = io.open('lua-format.config.bak', "w")

local line = inFile:read()
outFile:write(line)

inFile:close()
outFile:close()

-- file:seek(optional whence, optional offset)