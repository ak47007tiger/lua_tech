-- 2021/8/27
--loadstring("print(\"load str\")")
--local result = load("return \"hello\"")
--print(result())
--local file = io.open("TestMain.lua", "r")
--local content = file:read("*")
--print(content)
--file:close()

-- 以只读方式打开文件
local file = io.open("D:/hpl/projects/lua/lua_tech/src/test/TestMain.lua", "rb")

-- 设置默认输入文件为 test.lua
io.input(file)

-- 输出文件第一行
local srcCode = io.read("*all")
print(srcCode)

-- 关闭打开的文件
io.close(file)

local geneFunc = load(srcCode)
local result = geneFunc()
print(tostring(result))
