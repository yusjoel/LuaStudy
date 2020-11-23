Account = {
    balance = 0,
    withdraw = function(self, v)
        self.balance = self.balance - v
    end,
    new = function(self, o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end
}

local a = Account.new(Account, {balance = 100})
print(a.balance)
a.withdraw(a, 50)
print(a.balance)

-- 冒号操作符
-- a:foo(arg) 相当于 a.foo(a, arg)
-- 这是一个语法糖
local b = Account:new{balance = 200}
print(b.balance)
b:withdraw(50)
print(b.balance)

-- 也可以使用冒号操作符来进行定义
function Account:deposit(v)
    self.balance = self.balance + v
end

-- 但是不能这样
-- Account:deposit = function (v)
-- end

b:deposit(150)
print(b.balance)