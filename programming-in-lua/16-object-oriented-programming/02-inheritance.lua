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

-- 创建一个特殊账户, 允许透支, 透支限额有limit控制
SpecialAccount = Account:new()
function SpecialAccount:withdraw(v)
    if v - self.balance >= self:getLimit() then
        error "insufficient funds"
    end
    self.balance = self.balance - v
end
function SpecialAccount:getLimit()
    return self.limit or 0
end

-- 使用
local a = SpecialAccount:new({limit = 100})
print(a.balance)
a:deposit(100)
print(a.balance)
a:withdraw(150)
print(a.balance)
-- error
--a:withdraw(50)

-- 还可以为a这个实例创建新的行为
a.getLimit = function (self)
    return self.limit * 1.1
end
a:withdraw(50)
print(a.balance)

local b = SpecialAccount:new{limit = 100}
print(b.balance)
-- error
--b.withdraw(100)