-- 使用表构造式初始化数组
local squares = {1, 4, 9, 16}

-- 数组的起始索引是1
print(squares[1])

-- 使用循环语句初始化数组
local array1 = {}
for i = 1, 10 do
    array1[i] = 0
end

-- 获取数组长度
print(#array1)

-- 数组的索引可以是0, 还可以是负数
local array2 = {}
for i = -5, 5 do
    array2[i] = 0
end

print(#array2)