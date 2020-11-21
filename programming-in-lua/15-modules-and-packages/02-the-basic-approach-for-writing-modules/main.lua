package.path = debug.getinfo(1, "S").source:sub(2):match('^.*/') .. '?.lua'

local complex_v1 = require('complex_v1')

-- 有两种方式访问
-- 使用全局变量ComplexV1, 和使用局部变量complex_v1

local c1 = complex_v1.new(2,3)
local c2 = ComplexV1.new(3,7)
local c3 = complex_v1.add(c1, c2)
print(c3.r, c3.i)
c3 = ComplexV1.sub(c2, c1)
print(c3.r, c3.i)

local complex_v2 = require('complex_v2')
local c4 = complex_v2.new(2,3)
local c5 = complex_v2.new(3,7)
local c6 = complex_v2.add(c4, c5)
print(c6.r, c6.i)

-- 直接创建于文件名相同的全局模块
require('complex_v3')
local c7 = complex_v3.new(2,3)
local c8 = complex_v3.new(3,7)
local c9 = complex_v3.add(c7, c8)
print(c9.r, c9.i)