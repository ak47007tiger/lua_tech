-- local test_module = require("src.test.test_module")

for k, v in ipairs(arg) do
    print(k, v)
end

module_path = "src." .. arg[1]

print(module_path)

require(module_path)

