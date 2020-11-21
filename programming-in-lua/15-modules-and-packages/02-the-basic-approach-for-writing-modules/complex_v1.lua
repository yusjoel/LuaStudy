-- 声明了一个全局的表ComplexV1作为模块
-- 并在最后返回

ComplexV1 = {}
function ComplexV1.new(r, i)
    return {r = r, i = i}
end
-- defines a constant ’i’
ComplexV1.i = ComplexV1.new(0, 1)
function ComplexV1.add(c1, c2)
    return ComplexV1.new(c1.r + c2.r, c1.i + c2.i)
end
function ComplexV1.sub(c1, c2)
    return ComplexV1.new(c1.r - c2.r, c1.i - c2.i)
end
function ComplexV1.mul(c1, c2)
    return ComplexV1.new(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end
local function inv(c)
    local n = c.r ^ 2 + c.i ^ 2
    return ComplexV1.new(c.r / n, -c.i / n)
end
function ComplexV1.div(c1, c2)
    return ComplexV1.mul(c1, inv(c2))
end
return ComplexV1
