-- 空表
local table1 = {}

-- 初始化1, 关联数组（associative arrays）
-- 序号基于1
local table2 = {
    "apple",
    "pear",
    "orange",
    "grape"
}

for i = 1, 4 do
    print(i .. ' => ' .. table2[i])
end

-- 初始化2, 字典
local table3 = {
    name = 'apple',
    color = 'red',
    size = 'big'
}

-- 没有顺序
for key, value in pairs(table3) do
    print(key .. ' => ' .. value)
end