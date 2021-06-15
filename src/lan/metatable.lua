local function add_func(a, b)
    local c = {}
    local index = 1
    for k,v in ipairs(a) do
        c[index] = v
        index = index + 1
    end

    for k,v in ipairs(b) do
        c[index] = v
        index = index + 1
    end
    return c
end

local mt1 = {
    __add = add_func,
}

local t1 = {1,2,3, a='a',b='b'}
setmetatable(t1, mt1)
local t2 = {4,5,6}
setmetatable(t2, mt1)

local t3 = t1 + t2
print('------------1')
for k,v in ipairs(t3) do
    print(v)
end

