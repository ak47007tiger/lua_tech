local a = {}
a.name = 'a'
a.data = 'd1'

function a.hellow(self, name)
    -- body
    print(self.name.." hellow "..name)
    print("-------------------")
end

function say(self, content)
    -- body
    print(self.name..": "..content)
end

a.say = say

print('hello world!')

-- a.hellow('hi')
a:hellow('hi')

a:say('so')