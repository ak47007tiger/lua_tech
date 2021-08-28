-- 2021/8/23
local function define()
    local function testG1()
        print("testG1")
    end

    _G["testG1"] = testG1()
end

local function define2()
    function testG2()
        print("testG2 2")
    end

    --_G["testG1"] = testG1()
end

function testG2()
    print("testG2 1")
end

define()

--testG1()

print(_G["testG2"])
testG2()

define2()

print(_G["testG2"])
testG2()
