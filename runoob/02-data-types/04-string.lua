-- 字符串

-- 用单引号括住双引号
local message1 = '"用单引号括住双引号"'

-- 用双引号括主单引号
local message2 = "'用双引号括主单引号'"

-- 用方括号表示多行字符串
local message3 = [[
{
    key: value
}
]]

print(message1)
print(message2)
print(message3)

-- + 代表算术加法
local no = "2"
print(no + 1)

-- 如果字符串转数字类型失败会报错
-- print('error' + 1)

-- .. 代表字符串拼接
print(no .. 1)

-- # 求字符串长度
print(#'Length')
print(#'长度')