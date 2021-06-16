-- 2021/6/9
local pool = require("src.lib.Pool")
local id = 0
local dp = pool.create(function()
    id = id + 1
    return {id = id}
end, 32)
print(dp:debugInfo())

print(dp:obtain().id)
print("item1", dp:debugInfo())

local item2 = dp:obtain()
print("item2", dp:debugInfo())
print("item2.id",item2.id)

print(dp:obtain().id)
print("item3", dp:debugInfo())

dp:free(item2)
print(dp:debugInfo())
