Queue = {}
function Queue.new()
    return {first = 0, last = -1}
end

function Queue.enqueue(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue[last] = value
end

function Queue.dequeue(queue)
    local first = queue.first
    if first > queue.last then
        error "queue is empty"
    end

    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    return value
end

local q = Queue.new()
Queue.enqueue(q, 1)
Queue.enqueue(q, 2)
Queue.enqueue(q, 3)
print(Queue.dequeue(q))
Queue.enqueue(q, 4)
print(Queue.dequeue(q))
print(Queue.dequeue(q))
print(Queue.dequeue(q))

DoubleQueue = {}
function DoubleQueue.new()
    return {first = 0, last = -1}
end

function DoubleQueue.pushFirst(doubleQueue, value)
    local first = doubleQueue.first - 1
    doubleQueue.first = first
    doubleQueue[first] = value
end

function DoubleQueue.pushLast(doubleQueue, value)
    local last = doubleQueue.last + 1
    doubleQueue.last = last
    doubleQueue[last] = value
end

function DoubleQueue.popFirst(doubleQueue)
    local first = doubleQueue.first
    if first > doubleQueue.last then
        error "Double queue is emtpy"
    end

    local value = doubleQueue[first]
    doubleQueue[first] = nil
    doubleQueue.first = first + 1
    return value
end

function DoubleQueue.popLast(doubleQueue)
    local last = doubleQueue.last
    if doubleQueue.first > last then
        error "Double queue is emtpy"
    end

    local value = doubleQueue[last]
    doubleQueue[last] = nil
    doubleQueue.last = last - 1
    return value
end

local dq = DoubleQueue.new()
DoubleQueue.pushFirst(dq, "Hello Kitty")
DoubleQueue.pushFirst(dq, '青龙')
DoubleQueue.pushLast(dq, '白虎')

print(DoubleQueue.popFirst(dq))
print(DoubleQueue.popLast(dq))
print(DoubleQueue.popLast(dq))
