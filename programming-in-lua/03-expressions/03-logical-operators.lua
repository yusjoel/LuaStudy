--[[
    逻辑操作符
      and, or, not

    and, or 都使用短路求值(short-cut evaluation)
    X and Y =>
      if X then
        return Y
      else
        return X
      end

    X or Y:
      if X then
        return X
      else
        return Y
      end
]]

-- 当第一个类型检查没有通过时, 不会执行第二个取值操作
print('x and x.a')
local a = {tag = 'player'}
if type(a) == 'table' and a.tag == 'player' then
    print('OK')
else
    print('KO')
end

a = 1
if type(a) == 'table' and a.tag == 'player' then
    print('OK')
else
    print('KO')
end

-- x = x or defaultValue
-- 对于没有初始化的值赋予默认值
print('\nx = x or defaultValue')
local b
b = b or 2
print(b)
b = b or 3
print(b)

-- 三目操作符
-- a and b or c => a ? b : c
print('\na and b or c')
local c = 2 > 1 and 2 or 1
print(c)

-- 前提是 b ~= nil 
local e = nil
c = e == nil and e or 1
print(c)