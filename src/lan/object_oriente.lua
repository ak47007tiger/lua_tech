--[[
面向对象

1 构造类的步骤
create metatable
define new function
define other functions
create object
get or set field or call method

2 feature
修改对象的属性不会影响到metatable
--]]

local Entity = {
    field1 = 1,
    field2 = 'f2',
    name = 'entity',
}

function Entity.func1(self, input_val)
    print(self.field1)
    print(input_val)
end

function Entity:func2(input_val)
    print(self.field2)
    print(input_val)
end

local mt = {__index = Entity}

function Entity.new(o)
    local entity = o or {
    }
    setmetatable(entity, mt)
    return entity
end

local entity = Entity.new(nil)

print(entity.field2)
print(Entity.func1(entity, 'i'))
print(Entity:func2("i2"))
print('-------------------2')
print(entity.func2)
entity.field2 = 'b'
print(entity:func2("i2"))
print(Entity:func2("i2"))

print('------------ 1')
print(Entity.func2)

-- local mt = getmetatable(Entity)

-- for k, v in pairs(mt) do
--     print(k, v)
-- end
