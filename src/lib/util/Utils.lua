-- 2021/6/16
local Utils = {}

function Utils.reverseTable(t)
    local n = #t
    local i = 1
    while i < n do
        t[i],t[n] = t[n],t[i]
        i = i + 1
        n = n - 1
    end
    return t
end

local rt = Utils.reverseTable({1,2,3})
for i = 1, #rt do
    print(rt[i])
end

return Utils
