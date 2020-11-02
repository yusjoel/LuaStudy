-- 表构造式
local empty = {}
local days = {
    "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
}
local vector = {x = 1, y = 2}

-- 构造表达式是先创建表, 再初始化
-- 所以可以如下定义
local node = nil
for i = 1, 10, 2 do
    node = {previous = node, value = i}
end

while node do
    print(node.value)
    node = node.previous
end

-- 使用方块号, 显式地用表达式来初始化索引值
local opnames = {
    ["+"] = "add",
    ["-"] = "sub",
    [-1] = "negative"
}

-- 可以在最后多一个逗号, 这是一个方便生成构造式的特性
-- 也可以用分号代替逗号, 这个功能只是为了视觉上可以分隔两个部分
local table = {1, 2, 3, }
local data = {x = 10, y = 45; "one", "two", "three"}