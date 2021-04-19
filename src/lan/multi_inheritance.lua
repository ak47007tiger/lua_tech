local function search (k, plist)
    for i = 1, #plist do
        local v = plist[i][k] -- try 'i'-th superclass
        if v then return v end
    end
end

function createClass (...)
    local c = {} -- new class
    local parents = {...} -- list of parents
    
    -- class searches for absent methods in its list of parents
    setmetatable(c, {__index = function (t, k)
        return search(k, parents)
    end})
    
    -- prepare 'c' to be the metatable of its instances
    c.__index = c
    
    -- define a new constructor for this new class
    function c:new (o)
        o = o or {}
        setmetatable(o, c)
        return o
    end
    
    return c -- return new class
end

function test_for(aList)
    print("------------------------- 1")
    for item in ipairs(aList) do
        print(item)
    end

    print("------------------------- 2")
    for i = 1, #aList do
        print(i, aList[i])
    end
end

local aList = {'a',2,'b',4,'c'}

test_for(aList)
