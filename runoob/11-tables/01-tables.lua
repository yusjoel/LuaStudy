-- table.concat (list [, sep [, i [, j]]])
-- 拼接表中的各个元素为一个字符串
local fruits = {"banana", "orange", "apple"}

print('table.concat')
print(table.concat(fruits))
-- bananaorangeapple
print(table.concat(fruits, ", "))
-- banana, orange, apple
print(table.concat(fruits, ", ", 2, 3))
-- orange, apple

-- table.insert (list, [pos,] value)
print('\ntable.insert')
table.insert(fruits, 'mango')
print(table.concat(fruits, ", "))
-- banana, orange, apple, mango
table.insert(fruits, 2, 'grapes')
print(table.concat(fruits, ", "))
-- banana, grapes, orange, apple, mango

-- table.remove (table [, pos])
print('\ntable.remove')
table.remove(fruits)
print(table.concat(fruits, ", "))
-- banana, grapes, orange, apple
table.remove(fruits, 2)
print(table.concat(fruits, ", "))
-- banana, orange, apple

-- table.sort (table [, comp])
print('\ntable.sort')
table.sort(fruits)
print(table.concat(fruits, ", "))
-- apple, banana, orange
