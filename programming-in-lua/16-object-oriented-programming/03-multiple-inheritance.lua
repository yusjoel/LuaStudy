-- Class 1: Account
Account = {balance = 0}
function Account:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
function Account:deposit(v)
    self.balance = self.balance + v
end
function Account:withdraw(v)
    if v > self.balance then
        error "insufficient funds"
    end
    self.balance = self.balance - v
end

-- Class 2: Named
Named = {}
function Named:getname()
    return self.name
end
function Named:setname(n)
    self.name = n
end

-- 多重继承
-- plist是父类的列表
-- k是关键字
-- 找到第一个存在索引k的父类, 将该类的索引器返回
local function search(k, plist)
    for i = 1, #plist do
        local v = plist[i][k]
        if v then
            return v
        end
    end
end

local function createClass(...)
    local c = {}
    local parents = {...}

    -- 方法1: 每次访问都到父类列表中进行查找
    setmetatable(c, {
        __index = function(t, k)
            return search(k, parents)
        end
    })

    -- 方法2: 缓存了索引, 速度更快, 但缺点是如果对父类有修改则无法向下传播
    -- setmetatable(c, {
    --     __index = function(t, k)
    --         local v = search(k, parents)
    --         t[k] = v -- save for next access
    --         return v
    --     end
    -- })

    c.__index = c

    function c:new(o)
        o = o or {}
        setmetatable(o, c)
        return o
    end
    return c
end

NamedAccount = createClass(Account, Named)
local a = NamedAccount:new{balance = 100, name = 'account a'}
print(a:getname(), a.balance)
a:deposit(50)
a:setname('Account A')
print(a:getname(), a.balance)
