-- 2021/6/18
--[[
light weight class
没有继承、多态，只有封装、抽象
]]

--- @class LWClass
local LWClass = {}

function LWClass.class(className)
    local classObj = {
        className = className,
        __isClass = true
    }
    classObj.classType = classObj
    classObj.objAddress = tostring(classObj)

    function classObj.__index(pTable, accessName)
        return rawget(classObj, accessName)
    end

    function classObj.__tostring(pTable)
        if pTable == classObj then
            return string.format("class %s @%s", className, pTable.objAddress)
        end
        if classObj.tostring then
            return classObj.tostring(pTable)
        end
        return string.format("obj %s @%s", pTable.objAddress, className)
    end

    function classObj.__call(obj, ...)
        return obj.new(...)
    end

    setmetatable(classObj, classObj)

    function classObj.new(...)
        local obj = {}
        obj.objAddress = tostring(obj)

        setmetatable(obj, classObj)

        if obj.ctor then
            obj:ctor(...)
        end

        return obj
    end

    return classObj
end


return LWClass
