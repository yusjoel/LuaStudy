local function basicSerialize(o)
    if type(o) == "number" then
        return tostring(o)
    else -- assume it is a string
        return string.format("%q", o)
    end
end

local function save(name, value, saved)
    saved = saved or {} -- initial value
    io.write(name, " = ")
    if type(value) == "number" or type(value) == "string" then
        io.write(basicSerialize(value), "\n")
    elseif type(value) == "table" then
        if saved[value] then -- value already saved?
            io.write(saved[value], "\n") -- use its previous name
        else
            saved[value] = name -- save name for next time
            io.write("{}\n") -- create a new table
            for k, v in pairs(value) do -- save its fields
                k = basicSerialize(k)
                local fname = string.format("%s[%s]", name, k)
                save(fname, v, saved)
            end
        end
    else
        error("cannot save a " .. type(value))
    end
end

local a1 = {x = 1, y = 2, {3, 4, 5}}
a1[2] = a1
a1.z = a1[1]

save('a1', a1)

local a2 = {{'one', 'two', 3}}
local b2 = {k = a2[1]}

save('a2', a2)
save('b2', b2)

local t = {}
save('a2', a2, t)
save('b2', b2, t)