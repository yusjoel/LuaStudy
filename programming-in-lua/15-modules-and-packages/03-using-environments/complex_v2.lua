-- 这样做有另一个问题, 就是无法访问到全局变量

local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M

-- 方案1
-- 略有些消耗, 但会造成一个奇怪的问题, 可以通过模块来访问全局
-- setmetatable(M, {__index = _G})

-- 方案2
-- 在本地定义_G, 调用时加上_G.即可, 略快, 只是写起来累赘
local _G = _G

-- 方案3
-- 加入导入段, 运行速度最快, 最清晰, 当然写导入段也麻烦一些
local string = string

-- <= 5.1 时, 这里使用
-- setfenv(1, M)
-- > 5.1 之后, 使用
_ENV = M

function new(r, i)
    _G.print(string.format('new complex (%d, %d)', r, i))
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
