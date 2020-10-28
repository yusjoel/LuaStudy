-- Lua只有双精度类型

local a = 1
local b = 2.0
local c = 3e3

local longMaxValue = 9223372036854775807
local longMinValue = -9223372036854775808
local ulongMaxValue = 18446744073709551615
local floatEpsilon = 1.401298E-45
local floatMaxValue = 3.402823E+38
local floatMinValue = -3.402823E+38
local doubleEpsilon = 4.94065645841247E-324
local doubleMaxValue1 = 1.79769313486231E+308
local doubleMinValue1 = -1.79769313486231E+308
local doubleMaxValue = 1.79769313486232E+308
local doubleMinValue = -1.79769313486232E+308

print(a)
print(b)
print(c)

print(longMaxValue)
print(longMinValue)
print(ulongMaxValue)
print(floatEpsilon)
print(floatMaxValue)
print(floatMinValue)
print(doubleEpsilon)
print(doubleMaxValue1)
print(doubleMinValue1)
print(doubleMaxValue)
print(doubleMinValue)
