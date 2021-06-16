-- 2021/6/8

function demo(name)
    local sum = 0
    print(name, "start", coroutine.running(), os.time(), sum)
    for i = 1, 50000000 do
        if i % 2 == 0 then
            sum = sum + math.sqrt(sum / 2 + i, 2)
        else
            sum = sum + math.sqrt(sum + i)
        end
    end
    print(name, "end", os.time(), sum)
end

print("main start", coroutine.running(), os.time())

local c1Instance = coroutine.create(demo)
local c2Instance = coroutine.create(demo)

coroutine.resume(c1Instance, "c1")
print("mid...")
coroutine.resume(c2Instance, "c2")

print("main end", coroutine.running(), os.time())
