-- 全局变量, 只要没使用local显式声明为局部变量就是全局变量, 不管是在语法块中还是在函数中
-- 局部变量, 作用域为从声明位置开始到所在语句块结束

GlobalVariable1 = 1
local localVariable1 = 2

function Foo(n)
    GlobalVariable2 = n
    local localVariable2 = n + 1
    print(localVariable2)
end

print('loop start')
for i = 1, 10, 2 do
    GlobalVariable3 = i
    local localVariable3 = i;
    print(localVariable3)
end
print('loop end')

print()
print('before Foo()')
print(GlobalVariable1)
print(localVariable1)
print(GlobalVariable2)
print(localVariable2)
print(GlobalVariable3)
print(localVariable3)

print()
print('Foo()')
Foo(3)

print()
print('after Foo()')
print(GlobalVariable2)
print(localVariable2)


