--[[
    nil:
      无效值(non-value)

    boolean:
      true, false
      false, nil => false
      other      => true

      ''         => true
      0          => true

    number:
      双精度浮点型
      使用long/float, 修改luaconf.h

    string:
      字符可以是任何编码值, 所以可以用于存储二进制数据
      是不可变值(immutable values), 不能修改某个字符

      字面字符串(literal string)
        单引号, 双引号

      一对匹配的双括号
        可以多行, 不会解释转义序列
        括号内可以加入相同数量的等号

    table:
      关联数组( associative array)
      无法声明, 只能通过构造表达式(constructor expression)创建
        a = {}
      永远是匿名(anonymous)
      语法糖(syntactic sugar)
        a['x'] => a.x
      起始值是1, 但索引可以是任何值, 如负数, 0
 
    function:
      第一类值(First Class Value)

    userdata:
      用于表示一种由应用程序或C语言库所创建的类型
      这种类型只能进行赋值和相等性测试

    thread:
      参见coroutine
]]