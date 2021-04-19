
function if_func(i)
    if i < 10 then
        print("i < 10")
    else
        print("i >= 10")
    end
end

function while_func(cnt)
    local i = 1
    local sum = 0
    while i <= cnt do
        sum = sum + i
    end
    return sum
end

function repeat_func(cnt)
    local i = 1
    local result = 1
    repeat
        result = result + i * i
    until i <= cnt
    return result
end

function for_loop_func(plist)
    for i = 1, #plist do
        print(plist[i])
    end
end
