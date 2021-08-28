-- 2021/6/28

local array = {a=1,b=2,c=3,d=4,e=5}

for k, v in pairs(array) do
    if k == "b" then
        array["d"] = nil
    end
    print(k, v)
end

local a = nil

if not a then
    print("n a")
end