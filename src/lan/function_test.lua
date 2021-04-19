function no_ret()
    print("no ret")
end

local r = no_ret()

print(r)

function ret_multi_result(  )
    return 1 , 2, 3
end

print("single receive ---------------")

r = ret_multi_result()
print(r)

print("tuple receive ---------------")

local r1, r2, r3, r4 = ret_multi_result()
print(r1) 
print(r2) 
print(r3) 
print(r4) 

print("table receive ---------------")

local t1 = {ret_multi_result()}

print(t1[1])
print(t1[2])
print(t1[3])
print(t1[4])

print('func args ----------------------')

function func_args(...)
    for i, item in ipairs({...}) do
        print(i..","..item)
    end
end

func_args("a", "b", "c")

