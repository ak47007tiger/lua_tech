-- 2021/6/30
local strUtil = {}

function strUtil.match(shortStr,longStr)
    -- 判断short str是不是long str的一种缩写
    local il = 1
    for i = 1, #shortStr do
        local c = shortStr:sub(i, i)
        local find = false
        for j = il, #longStr do
            il = il + 1
            local lc = longStr:sub(j, j)
            if c == lc then
                find = true
                break
            end
        end
        if not find then
            return false
        end
    end
    return true
end

function strUtil.easy_format(...)
    local items = {...}
    if next(items) then
        local cnt = select('#', ...)
        if cnt == 1 then
            return tostring(select(1, ...))
        end
        if cnt == 2 then
            return string.format("%s, %s", tostring(select(1, ...)), tostring(select(2, ...)))
        end
        if cnt == 3 then
            return string.format("%s, %s, %s", tostring(select(1, ...)), tostring(select(2, ...)), tostring(select(3, ...)))
        end
        local itemsStr = {}
        for i = 1, cnt do
            table.insert(itemsStr, tostring(select(i, ...)))
        end
        return table.concat(itemsStr, ',')
    end
    return "empty"
end

return strUtil
