
local polyline = {
    color="blue", thickness=2, npoints=4,
    {x=0,   y=0},
    {x=-10, y=0},
    {x=-10, y=1},
    {x=0,   y=1}
}

print(polyline[0])
print(polyline.color)

print(polyline[1])
print(polyline[2])
print(polyline[3])

local t1 = {1,2,3,4}
print(t1[0])
print(t1[1])

local t2 = {nil}
print(t2[1])
