-- 2021/6/18

local LWClass = require("src.lib.LWClass")

local TestLWClass = LWClass.class("TestLWClass")

function TestLWClass:ctor(a, b, c)
    print(a, b, c)
end

function TestLWClass.tostring(pTable)
    return "TestLWClass"
end

function TestLWClass:hello()
    print("TestLWClass hello")
end

print(1, TestLWClass)

local tlwc = TestLWClass(1,"a", LWClass)

print(2, tlwc)

tlwc:hello()

