-- package.loaded["module_name"]
-- require 的寻找顺序
-- package.path = LUA_PATH
print(package.path)
-- pacakge.cpath = LUA_CPATH
print(package.cpath)
-- 模块名为a-b, require会调用luaopen_b, 所以可以把版本号写在a的位置