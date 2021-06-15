-- local test_module = require("src.test.test_module")

for k, v in ipairs(arg) do
    print(k, v)
end

if arg[1] ~= nil then
    module_path = "src." .. arg[1]
else
    module_path = "src.test.test_module"
end


print(module_path)

require(module_path)

