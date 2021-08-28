-- 2021/8/18

local function Test1()
    local t1 = os.time()
    for i = 1, 10000 do
        local dataList = {}
        for j = 1, 1000 do
            table.insert(dataList, j)
        end
    end
    local t2 = os.time()
    print(t2 - t1)
end

local function Test2()
    local t1 = os.time()
    local dataList = {}
    for i = 1, 10000 do
        while #dataList > 0 do
            table.remove(dataList)
        end
        for j = 1, 1000 do
            table.insert(dataList, j)
        end
    end
    local t2 = os.time()
    print(t2 - t1)
end

Test1()
Test2()
