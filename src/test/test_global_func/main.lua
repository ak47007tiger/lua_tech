-- 2021/8/23

local sub = require("src.test.test_global_func.sub")

require("src.test.test_global_func.define")

sub.hello()

local t1 = {}

for i = 1, 4 do
    table.insert(t1, 1, i)
end

for i, v in ipairs(t1) do
    print(i, v)
end

print("asdfasdf")
t1 = {[1]=1,[2]=2}
for k, v in pairs(t1) do
    print(k, type(k), v, type(v))
end
