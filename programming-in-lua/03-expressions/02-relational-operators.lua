--[[
    关系操作符
      <, >, <=, >=, ==, ~=

    nil:
      只和自身相等
    table, userdata, function:
      做引用比较

    只有number和string可以进行大小性比较
      string:
        按照字母次序比较大小, 要注意: "2" > "15"
]]