-- 2021/7/29

local function Test1()
    local t1 = {
        a = 1,
        b = 2,
        c = 3,
    }

    for k, v in pairs(t1) do
        print(k,v)
    end

    local t2 = {}
    setmetatable(t2, {
        __index = t1,
        __newindex = function(t, k, v)

        end
    })
    print("t2 ------------")
    for k, v in pairs(t2) do
        print(k, v)
    end
end

Test1()

local eps = 1e-6
print(eps, type(eps))
print(eps > 1)
print(eps < 0.0001)
print(eps < 0.00001)
print(eps < 0.000001)
print(math.acos(-1))
