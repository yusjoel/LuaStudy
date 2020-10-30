-- setmetatable
-- getmetatable
print('setmetatable & getmetatable')
local parentTable = {}
local childTable = {}
print(parentTable)
print(childTable)

local returnValue = setmetatable(childTable, parentTable)
print(getmetatable(childTable))
print(returnValue)

-- 可以重新设置metatable
setmetatable(childTable, {})
print(getmetatable(childTable))

setmetatable(childTable, parentTable)

-- __index
-- 处理 table.key 或 table[key] 的流程
-- 1. table中有没有这个key, 找到则返回, 找不到继续
-- 2. table.metatable是不是空, 是返回空, 不是继续
-- 3. metable.__index是不是空, 是返回空, 不是继续
-- 4. __index是不是函数, 是调用函数, 是表, 回到步骤1

print('\n__index')

-- 并不是原表的元素就是本表的元素
parentTable.foo = 'foo'
print(childTable.foo)

-- 如果__index是一个函数, 那么就调用这个函数, 并把table和key当成参数传入
parentTable.__index = function(table, key)
    if key == 'foo' then
        return 'foo'
    end

    return 'bar'
end
print()
print(childTable.foo)
print(childTable.zoo)

-- 如果__index是一个表, 那么就在该表中查找
parentTable.__index = {foo = 'foo'}
print()
print(childTable.foo)
print(childTable.zoo)

-- 多层嵌套
local grandChildTable = setmetatable({zoo = 'zoo'}, {__index = childTable})
print()
print(grandChildTable.foo)
print(grandChildTable.zoo)

-- __newindex
-- 用于新增索引, [?]流程不明
print('\n__newindex')
parentTable.__newindex = function (table, key, value)
    print(table, key, value)
    rawset(table, key, value)
end

childTable.zoo = 'new_zoo'
print(childTable.zoo)
childTable.zoo = 'not_zoo'
print(childTable.zoo)
childTable.foo = 'new_foo'
print(childTable.foo)

--[[
    运算符重载
    __add	    对应的运算符 '+'.
    __sub	    对应的运算符 '-'.
    __mul	    对应的运算符 '*'.
    __div	    对应的运算符 '/'.
    __mod	    对应的运算符 '%'.
    __unm	    对应的运算符 '-'.
    __concat	对应的运算符 '..'.
    __eq	    对应的运算符 '=='.
    __lt	    对应的运算符 '<'.
    __le	    对应的运算符 '<='.
]]
print('\noperator')
local vector2 = {
    __add = function (self, other)
        self.x = self.x + other.x
        self.y = self.y + other.y
        return self
    end
}

local v1 = setmetatable({x = 1, y = 2}, vector2)
local v2 = setmetatable({x = 3, y = 4}, vector2)
print(v1.x, v1.y, v2.x, v2.y)
local v3 = v1 + v2
print(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y)

-- __call
-- 将table当成函数调用时使用
print('\n__call')
vector2.__call = function (table, x, y)
    table.x = x
    table.y = y
end

local v4 = setmetatable({}, vector2)
v4(1, 3)
print(v4.x, v4.y)

-- __tostring
-- 用于修改表的输出行为
print('\n__tostring')
vector2.__tostring = function (table)
    print(string.format('(%d, %d)', table.x, table.y))
end

print(v4)