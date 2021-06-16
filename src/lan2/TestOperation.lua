-- 2021/6/8
local r = 0 < 4 and 4 < 8
print(r)

local t = {1,2,3,4}
print(t[-1])

for k, v in pairs(t) do
    print(k, v)
end

local a = 0 or 3
print(a)
