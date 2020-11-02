--[[
    if condition then
        ...
    elseif condition then
        ...
    else
        ...
    end

    while condition do
        ...
    end

    repeat
        ...
    until condition

    数字型for
    for i = start, end, step do
        ...
    end

    泛型for
    for key, value in pairs(t) do
        
    end
]]

-- 局部变量的作用域包括了条件测试
local function babylonianAlgorithm(x)
    local squareRoot = x / 2;
    repeat
        squareRoot = (squareRoot + x / squareRoot) / 2
        local error = math.abs(squareRoot * squareRoot - x)
    until error < x / 10000

    return squareRoot
end

print(babylonianAlgorithm(2.25))
print(babylonianAlgorithm(0.81))

-- 数字型for的控制变量自动的声明为局部变量
local i = 3
-- 这里会提示: Redefined local `i`
for i = 1, 10, 2 do
    print(i)
end
print(i)
