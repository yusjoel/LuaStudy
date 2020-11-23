-- 方法1: 在newAccount函数内部创建表, 然后返回另一个表
-- 返回的表中没有balance, 只有对内部表的访问
-- 由于self包含在内部, 所以也不需要使用冒号
local function newAccount(initialBalance)
    local self = {balance = initialBalance}
    local withdraw = function(v)
        self.balance = self.balance - v
    end
    local deposit = function(v)
        self.balance = self.balance + v
    end
    local getBalance = function()
        return self.balance
    end
    return {withdraw = withdraw, deposit = deposit, getBalance = getBalance}
end

local a = newAccount(100)
print(a.getBalance())
a.withdraw(50)
print(a.getBalance())
-- nil, 这里无法直接访问
print(a.balance)