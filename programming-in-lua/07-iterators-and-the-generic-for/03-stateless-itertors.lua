-- 无状态迭代器
-- 优点是不用创建闭包
local function iterator(array, index)
    index = index + 1
    local value = array[index]
    if value then
        return index, value
    end
end

local function ipairs(array)
    return iterator, array, 0
end

for index, value in ipairs{1, 3, 5, 7, 9} do
    print(index, value)
end

-- pairs 内部调用的是 next, 下面的写法和 pairs 等价
local person = {
    name = 'Sam',
    sex = 'Male',
    age = '18'
}
for key, value in next, person do
    print(key, value)
end