-- 消除模块名, 以及文件尾部的返回
-- 全局的模块名使用文件名, 也就是require传入的参数
local modname = ...
local M = {}
_G[modname] = M
package.loaded[modname] = M

function M.new(r, i)
    return {r = r, i = i}
end
-- defines a constant ’i’
M.i = M.new(0, 1)
function M.add(c1, c2)
    return M.new(c1.r + c2.r, c1.i + c2.i)
end
function M.sub(c1, c2)
    return M.new(c1.r - c2.r, c1.i - c2.i)
end
function M.mul(c1, c2)
    return M.new(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end
local function inv(c)
    local n = c.r ^ 2 + c.i ^ 2
    return M.new(c.r / n, -c.i / n)
end
function M.div(c1, c2)
    return M.mul(c1, inv(c2))
end