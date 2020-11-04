-- 迭代器
-- 是一种可以遍历一个集合中所有元素的机制
-- 在Lua中, 迭代器是一个函数, 每调用一次函数就返回集合中下一个元素, 直到nil为止
--
-- 迭代器需要保持一些状态, 使用闭合函数是一种很好的实现方法
-- 创建该闭合函数的函数叫做工厂
local function values(array)
    local i = 0
    return function()
        i = i + 1
        return array[i]
    end
end

print('iterator')
local iterator = values {1, 2, 4, 8, 16}
local item = iterator()
while item do
    print(item)
    item = iterator()
end

--  使用泛型for
print('\ngeneric for')
for i in values {1, 3, 5, 7} do
    print(i)
end
