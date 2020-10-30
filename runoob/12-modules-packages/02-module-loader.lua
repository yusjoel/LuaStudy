-- package.path
print(package.path)

-- require
local moduleName = "runoob/12-modules-packages/01-module"
local m = require(moduleName)

-- package.loaded
print(package.loaded[moduleName])

print(m.constant)

m.func1()
m.func3()

-- m.func2()
-- func2()