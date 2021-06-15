local function debug_function(func)
    local sayDebugInfo = debug.getinfo(func)
    for k, v in pairs(sayDebugInfo) do
        print(k, v)
    end
end

local function getSpace(level)
    local space = ""
    for i = 1, level do
        space = space .. "  "
    end
    return space
end

local function debug_table(pTable, level)
    print("level ------------ ", level)
    for k, v in pairs(pTable) do
        if type(v) == "table" then
            debug_table(pTable, level + 1)
        else
            print(getSpace(level), k, "--", v)
        end
    end
end

return {
    debug_function = debug_function,
    debug_table = debug_table,
}
