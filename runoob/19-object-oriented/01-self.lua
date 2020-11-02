--[[
    使用 : 定义的函数隐含 self 参数
]]

local a = {name = 'Sam', age = '20'}
function a:print()
    print(self.name, self.age)
end

a:print()