-- 集合
function Set(array)
    local set = {}
    for _, value in ipairs(array) do
        set[value] = true
    end
    return set
end

local weekday = Set{"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"}

print('Sunday is weekday: ' .. (weekday["Sunday"] and 'yes' or 'no'))
print('Monday is weekday: ' .. (weekday["Monday"] and 'yes' or 'no'))

-- 包, 多重集合(Multiset), 允许元素出现多次
Bag = {}
function Bag.new(array)
    local bag = {}
    for _, value in ipairs(array) do
        Bag.insert(bag, value)
    end
    return bag
end

function Bag.insert(bag, element)
    bag[element] = (bag[element] or 0) + 1
end

function Bag.remove(bag, element)
    local count = bag[element]
    bag[element] = (count and count > 1) and count - 1 or nil
end

print '-------'
local bag = Bag.new{'Red', "Green", 'Blue', 'Red', 'Green', 'Green', 'Blue'}

for key, value in pairs(bag) do
    print(key, value)
end

print '-------'
Bag.remove(bag, 'Red')
Bag.remove(bag, 'Red')
Bag.remove(bag, 'Green')
Bag.remove(bag, 'Blue')
Bag.remove(bag, 'Blue')
Bag.remove(bag, 'Blue')

for key, value in pairs(bag) do
    print(key, value)
end
