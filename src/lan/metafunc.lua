local function Test1()
    local function indexFunc(a, name)
        print(a, type(a), name)
    end
    local table1 = {
        __index = indexFunc
    }
    setmetatable(table1, table1)
    print(table1)
    local r = table1["asdf"]
end

Test1()
