-- 具名参数
-- 假设有一个函数如下
local function _DrawLine(fromX, fromY, toX, toY, color, lineType)
    -- 在屏幕上画线
    print(string.format('(%d, %d) -> (%d, %d) - %s - %s', fromX, fromY, toX,
                        toY, color, lineType))
end

-- 可以改造成
local function DrawLine(options)
    -- 必要的参数检查
    if type(options.fromX) ~= 'number' then
        error('no fromX')
    end
    if type(options.fromY) ~= 'number' then
        error('no fromY')
    end
    if type(options.toX) ~= 'number' then
        error('no toX')
    end
    if type(options.toY) ~= 'number' then
        error('no toY')
    end

    _DrawLine(options.fromX, options.fromY, options.toX, options.toY,
              options.color or 'red', options.lineType or 'dot')
end

-- 调用时
DrawLine {fromX = 1, fromY = 2, toX = 3, toY = 4, lineType = 'solid'}

-- 把from写成了form
DrawLine {formX = 1, formY = 2, toX = 3, toY = 4, lineType = 'solid'}