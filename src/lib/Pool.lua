-- 2021/6/9
--- @class Pool
local Pool = {}
local poolmt = {__index = Pool}

function Pool.create(newObject, poolSize)
    poolSize = poolSize or 16
    assert(newObject, "A function that returns new objects for the pool is required.")

    local freeObjects = {}
    for _ = 1, poolSize do
        table.insert(freeObjects, newObject())
    end

    return setmetatable({
        freeObjects = freeObjects,
        usedObjects = {},
        usedObjCnt = 0,
        newObject = newObject
    },
            poolmt
    )
end

function Pool:obtain()
    local item = #self.freeObjects == 0 and self.newObject() or table.remove(self.freeObjects)
    self.usedObjects[item] = item
    self.usedObjCnt = self.usedObjCnt + 1
    return item
end

function Pool:free(obj)
    assert(obj, "An object to be freed must be passed.")

    table.insert(self.freeObjects, obj)
    if obj.reset then obj.reset() end
    if self.usedObjects[obj] ~= nil then
        self.usedObjects[obj] = nil
        self.usedObjCnt = self.usedObjCnt - 1
    end
end

function Pool:clear(hook)
    for k, v in pairs(self.freeObjects) do
        if hook then
            hook(v)
        end
        self.freeObjects[k] = nil
    end
    for k, v in pairs(self.usedObjects) do
        if hook then
            hook(v)
        end
        self.usedObjects[k] = nil
    end
    self.usedObjCnt = 0
end

function Pool:size()
    return #self.freeObjects
end

function Pool:debugInfo()
    return tostring(self:size()) .. "," .. tostring(self.usedObjCnt)
end

return Pool
