print("------------------1")

local t1 = {a='a',b='b'}

for k, v in pairs(t1) do
    print(k, v)
end

function index_func(a_table, k)
    print(a_table, k)
    return "empty"
end

local mt1 = {
    __index = index_func,
}

setmetatable(t1, mt1)
print(t1.a)
print(t1.c)

print("------------------2")
mt1.__index = {c='c'}

print(t1.a, t1.c)

print("------------------3")
function new_index_func(a_table, k, v)
    print('call new_index_func')
    rawset(a_table, k, v)
end
mt1.__newindex = new_index_func

t1.d = 'd'

for k, v in pairs(t1) do
    print(k, v)
end

print("------------------4")

local t2 = {}
mt1.__newindex = t2

t1.e = 'e'

for k, v in pairs(t1) do
    print(k, v)
end

print("index table")

for k, v in pairs(t2) do
    print(k, v)
end
