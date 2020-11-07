local function name2node(graph, name)
    if not graph[name] then
        -- node does not exist; create a new one
        graph[name] = {name = name, adj = {}}
    end
    return graph[name]
end

local function findpath(curr, to, path, visited)
    path = path or {}
    visited = visited or {}
    if visited[curr] then -- node already visited?
        return nil -- no path here
    end
    visited[curr] = true -- mark node as visited
    path[#path + 1] = curr -- add it to path
    if curr == to then -- final node?
        return path
    end
    -- try all adjacent nodes
    for node in pairs(curr.adj) do
        local p = findpath(node, to, path, visited)
        if p then
            return p
        end
    end
    path[#path] = nil -- remove node from path
end

local function readgraph(filename)
    local graph = {}
    for line in io.lines(filename) do
        -- split line in two names
        local namefrom, nameto = string.match(line, "(%S+)%s+(%S+)")
        -- find corresponding nodes
        local from = name2node(graph, namefrom)
        local to = name2node(graph, nameto)
        -- adds ’to’ to the adjacent set of ’from’
        from.adj[to] = true
    end
    return graph
end

local function printpath(path)
    for i = 1, #path do
        print(path[i].name)
    end
end

local function main()
    local path = debug.getinfo(1, "S").source:sub(2):match('^.*/')
    local inputfile = path .. '07.graph.txt'

    local g = readgraph(inputfile)
    local a = name2node(g, "a")
    local b = name2node(g, "b")
    local p = findpath(a, b)
    if p then
        printpath(p)
    end
end

main()
