-- 布尔值: true, false
print(type(true))
print(type(false))

-- 在条件判断时, nil是false
if nil then
    print('nil is true')
else
    print('nil is false')
end

-- nil本身不是布尔类型
print(type(nil))

-- 要注意0不是false
if 0 then
    print('0 is true')
else
    print('0 is false')
end
