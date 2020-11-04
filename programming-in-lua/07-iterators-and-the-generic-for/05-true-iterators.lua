-- forEach(array, callback) 
-- 这种类型的函数称为: 真正的迭代器
-- 将之前描述的函数称为: 生成器(generator)

local function forEach(array, callback)
    for index, value in ipairs(array) do
        callback(index, value)
    end
end

forEach({1, 2, 3}, print)

-- 缺点是
-- 1. 无法嵌套
-- 2. 无法break和return