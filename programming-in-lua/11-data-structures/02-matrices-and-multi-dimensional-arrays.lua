-- 矩阵1: 数组的数组
local matrix1 = {}
for i = 1, 4 do
    matrix1[i] = {}
    for j = 1, 4 do
        matrix1[i][j] = 0
    end
end

-- 矩阵2: 使用一维数组
local matrix2 = {}
for i = 1, 4 do
    for j = 1, 4 do
        matrix2[(i - 1) * 4 + j] = 0
    end
end

-- 矩阵3: 用字典
local matrix3 = {}
for i = 1, 4 do
    for j = 1, 4 do
        matrix2[i .. j] = 0
    end
end
