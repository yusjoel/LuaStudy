-- 将模块设置为环境, 
-- 这样在调用行数的使用不用再加M.
-- 忘记添加local时, 也不会污染_G, 而是把私有变成了公有

local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M

_ENV = M

function new(r, i)
    return {r = r, i = i}
end
-- defines a constant ’i’
i = new(0, 1)
function add(c1, c2)
    return new(c1.r + c2.r, c1.i + c2.i)
end
function sub(c1, c2)
    return new(c1.r - c2.r, c1.i - c2.i)
end
function mul(c1, c2)
    return new(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end
local function inv(c)
    local n = c.r ^ 2 + c.i ^ 2
    return new(c.r / n, -c.i / n)
end
function div(c1, c2)
    return mul(c1, inv(c2))
end