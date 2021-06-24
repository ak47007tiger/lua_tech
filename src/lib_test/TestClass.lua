local debug_util = require("src.lib.util.debug_util")
local Class = require("src.lib.Class")

local function Test1()
    local user = {
        name = "u1"
    }

    function user:say(content)
        print(self.name, "say", content)
    end

    function user:run(num)
    end

    function user.fly(num)
    end

    print("---------------- debug")
    debug_util.debug_table(debug.getinfo(user.run), 0)
    debug_util.debug_table(debug.getinfo(user.fly), 0)
    print("---------------- end")

    user.say(user, "hello")
    user:say("world")
end

local function Test2()
    local Game = Class.class("Game")
    function Game:build(name)
        self.name = name
        self.gameType = nil
    end

    function Game:happy()
        return 1
    end

    local Electric = Class.class("Electric")
    function Electric:from()
        return "Computer"
    end

    local SlgGame = Class.class("SlgGame", Game, Electric)
    function SlgGame:build(name)
        print("SlgGame.build", SlgGame == self.classType, name, #self.superTypes)
        self.super.build(self, name)
        self.gameType = "slg"
    end

    function SlgGame:happy()
        local name = self.name
        local gameType = self.gameType
        local from = self:from()
        return string.format("%s %s %s %d", name, gameType, from, 20)
    end

    local civm = SlgGame.new("Civm")
    local content = civm:happy()
    print(content)
end

Test2()
