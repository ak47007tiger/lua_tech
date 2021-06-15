--[[
":"的作用
定义函数时：定义的函数自动增加一个参数放到第一个位置作为self
调用时：在调用对象方法的时候自动传入一个self

metatable作用
定义对象内建方法的运算规则
定义运算符对对象的运算规则

__index作用
控制访问
可以是function or table

rawget
访问对象属性但是不走__index

变相对象的特性：封装、继承、多态、抽象

实现封装
object
class的一个实例，object去class里面查找属性、类信息

class
定义对象的属性和方法

实现单继承
super class
如果一个class有super class，除了查找class本身，还要递归查找super class
]]

local SClass = {
    createTime = 2021,
    className = "SClass",
}
SClass.classType = SClass

function SClass:birthDay()
    return self.createTime
end

local AClass = {
    className = "AClass",
    name = nil,
}
AClass.classType = AClass
setmetatable(AClass, {__index=SClass})

function AClass.new(...)
    local aObj = {}

    setmetatable(aObj, {
        __index = AClass
    })

    aObj:build(...)

    return aObj
end

function AClass:build(name, power)
    self.name = name
    self.power = power
end

function AClass:say(content)
    print(self.name, "say", content)
end

local a = AClass.new("dc", 2)

a:say("hello")
print(a.className)
print(a.classType == AClass)
print(a:birthDay())
a.createTime = 2022
print(a:birthDay())
print(SClass.createTime)
print(a.power)

return AClass
