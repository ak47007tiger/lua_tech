
local funcA = function (a, b) return a + b end
local funcB = function (a, b) print(a, b) end

local resultA = funcA(3,2)
print(resultA)
funcB(1,2)

print('counter -------------- ')

function newCounter ()
    local count = 0
    return function () -- anonymous function
                count = count + 1
                return count
            end
end

local c1 = newCounter()
local c2 = newCounter()

print(c1())
print(c2())
print(c1())

print(_G['hellow'])

local a = 'asdf'

print(type(a))
