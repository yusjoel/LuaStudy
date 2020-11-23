-- 使用闭包代替表
-- 闭包比表的访问快, 但是不能继承
local function newAccount(initialBalance)
    local balance = initialBalance;
    return function(action, v)
        if action == "getBalance" then
            return balance
        elseif action == "withdraw" then
            balance = balance - v
        elseif action == "deposit" then
            balance = balance + v
        else
            error("invalid action")
        end
    end
end

local a = newAccount(100)
print(a('getBalance'))
a('withdraw', 50)
print(a('getBalance'))
a('deposit', 150)
print(a('getBalance'))