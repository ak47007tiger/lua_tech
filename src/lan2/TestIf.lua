-- 2021/6/16

local t = {}

if t.a then
    print("a")
else
    print("nil")
end

local t2 = nil

t2 = t2 or {101}
print(t2, t2[1])
