-- 2021/6/18
local a = 1.3
local b = 3

print(type(a), type(b))

local t = {100}

local i = math.floor(a)

print(i, type(i))

print(t[i])

local a = ""
if a then
    print("hello a")
end