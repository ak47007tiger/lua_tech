---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2021/5/10 17:34
---

local mapFunctionsIndex = {}

local mapFunctions = {
    __index = mapFunctionsIndex
}

function Test()

end

function mapFunctionsIndex:hello(content)
    print("hello")
    print(self)
    print(content)
end

local mapObj = {
    size = 1.0,
    grid = {1,2,3},
}

setmetatable(mapObj, mapFunctions)

print(mapObj.hello)
mapObj:hello("asdf")
mapObj:hello()
