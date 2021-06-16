-- 2021/6/16


local function Fund3322(total, current)
    local one = total / 10.0
    print(one * 3 - current[1])
    print(one * 3 - current[2])
    print(one * 2 - current[3])
    print(one * 2 - current[4])
end

Fund3322(40000, {9047, 8970, 5967, 5780})
