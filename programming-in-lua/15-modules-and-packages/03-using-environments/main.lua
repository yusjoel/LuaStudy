package.path = debug.getinfo(1, "S").source:sub(2):match('^.*/') .. '?.lua'

require('complex_v1')
local c1 = complex_v1.new(2,3)
local c2 = complex_v1.new(3,7)
local c3 = complex_v1.add(c1, c2)
print(c3.r, c3.i)
c3 = complex_v1.sub(c2, c1)
print(c3.r, c3.i)

require 'complex_v2'
local c4 = complex_v2.new(2,3)
local c5 = complex_v2.new(3,7)
local c6 = complex_v2.add(c4, c5)
print(c6.r, c6.i)