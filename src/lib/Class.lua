local Class = {}

local function createSuper(superTypes)
    local super = {}

    local function access(_, accessName)
        local function invoke(self, ...)
            for k, v in pairs(superTypes) do
                v[accessName](self, ...)
            end
        end
        return invoke
    end

    setmetatable(super, {
        __index = access,
    })
    return super
end

function Class.class(className, ...)
    local superTypes = {...}
    local classObj = {
        className = className,
        isMultiInherit = #superTypes > 1,
        superTypes = superTypes,
        super = createSuper(superTypes)
    }
    classObj.classType = classObj

    local function access(_, accessName)
        local filed = rawget(classObj, accessName)
        if filed ~= nil then
            return filed
        end

        for k, v in pairs(classObj.superTypes) do
            local field = v[accessName]
            if field ~= nil then
                return field
            end
        end
        return nil
    end

    local classObjAddress = tostring(classObj)

    local function classToString()
        return string.format("class %s %s", className, classObjAddress)
    end

    setmetatable(classObj, {
        __index = access,
        __tostring = classToString,
    })

    function classObj:build(...)
        for k, v in pairs(classObj.superTypes) do
            v.build(self, ...)
        end
    end

    function classObj.new(...)
        local obj = {}
        local objAddress = tostring(obj)

        local function objToString()
            return string.format("obj %s @%s", objAddress, classObj.className)
        end

        setmetatable(obj, {
            __index = classObj,
            __tostring = objToString,
        })

        obj:build(...)
        return obj
    end

    return classObj
end

return Class
