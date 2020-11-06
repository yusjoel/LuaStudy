--[[
    演示了如何用Lua定义数据
    最骚的地方在于把Entry当成了一个全局函数, 通过赋予不同的函数, 来执行不同的操作
]]

local function fwrite(fmt, ...)
    return io.write(string.format(fmt, ...))
end

local count = 0

local function writeHeader()
    io.write([[
        <html>
        <head><title>Projects using Lua</title></head>
        <body bgcolor="#FFFFFF">
        Here are brief descriptions of some projects around the
        world that use <a href="home.html">Lua</a>.
        <br>
        ]])
end

local function writeEntryTitle(o)
    count = count + 1
    local title = o.title or '(no title)'
    fwrite('<li><a href="#%d">%s</a>\n', count, title)
end

local function writeEntryContent(o)
    count = count + 1
    fwrite('<hr>\n<h3>\n')
    local href = o.url and string.format(' href="%s"', o.url) or ''
    local title = o.title or o.org or 'org'
    fwrite('<a name="%d"%s>%s</a>\n', count, href, title)
    if o.title and o.org then
        fwrite('<br>\n<small><em>%s</em></small>', o.org)
    end
    fwrite('\n</h3>\n')
    if o.description then
        fwrite('%s<p>\n', string.gsub(o.description, '\n\n+', '<p>\n'))
    end
    if o.email then
        fwrite('Contact: <a href="mailto:%s">%s</a>\n', o.email,
               o.contact or o.email)
    elseif o.contact then
        fwrite('Contact: %s\n', o.contact)
    end
end

local function writeTail()
    fwrite('</body></html>\n')
end

local function main()
    local path = debug.getinfo(1, "S").source:sub(2):match('^.*/')
    local inputfile = path .. 'data.lua'
    writeHeader()

    local func = loadfile(inputfile)

    count = 0
    Entry = writeEntryTitle
    fwrite('<ul>\n')
    func()
    fwrite('</ul>\n')

    count = 0
    Entry = writeEntryContent
    func()
    writeTail()
end

main()
