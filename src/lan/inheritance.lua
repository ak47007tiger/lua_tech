--[[
实现继承的方法
1 定义类 A
2 创建类 B = A:new()
3 为B增加新方法 or 修改B继承自A的方法
4 创建B的实例 b = B:new()
--]]

local Game = nil
local SLGGame = nil 

Game = {
    name="game",
    happy=100,
    desc="it is game"
}

function Game:new(o)
    local game = o or {}
    self.__index = self
    setmetatable(game, self)
    return game
end

function Game:get_introduce()
    return self.name .. " " .. self.desc
end

SLGGame = Game:new()

function SLGGame:get_introduce()
    local mt = getmetatable(getmetatable(self))
    local superFunc = mt.get_introduce
    if superFunc ~= nil then
        print("super get_introduce " .. superFunc(mt))
    end

    return self.name .. " slg " .. self.desc
end

function SLGGame:get_happyness()
    local mt = getmetatable(self)
    local superFunc = mt.get_happyness
    if superFunc ~= nil then
        return superFunc(mt)
    end
    return self.happy + 10
end

local slgGame = SLGGame:new()

print(slgGame:get_introduce())
print(slgGame:get_happyness())
