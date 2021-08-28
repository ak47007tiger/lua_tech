-- 2021/8/18

local strUtil = require("src.lib.util.strUtil")

print(strUtil.easy_format(1, 2, nil))
print(strUtil.easy_format(1, nil))
print(strUtil.easy_format("asdf, ee", 1, nil, true, "ieiw", false))

local vm = {a=1,b=2,c=3,4}

for k, v in pairs(vm) do
    if k == 1 then
        vm["c"] = nil
    end
    print(k, v)
end

print(tonumber("93aa,ee"))
print(tonumber("123"))
