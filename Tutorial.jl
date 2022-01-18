# https://www.youtube.com/watch?v=sE67bP2PnOo

using Printf
using Statistics

s = "Hello World"
println(s)

function Num()
    x::Int8 = 10
    println(typeof(x))
end

Num()


i = parse(Int16, "1")
println(typeof(i))

s = "Some words"
println(length(s))
println(s[1]) # starts counting at 1
println(s[6:end])

t = string("One", "Two", "Three")
println(t)
println("One"*"Two")

v = 2
w = 3
println("$v + $w = $(v+w)")

# Multiline Strings
lines = """I
have
many
lines"""

println("Chocolate" > lines)
println(findfirst(isequal('o'), "Monkey"))
println(occursin("key", "monkey"))

age = 12
if age >= 3 && age <= 6
    println("You're in Kindergarten")
elseif age >= 7 && age <= 18
    println("You're in school")
else
    print("Stay home")
end

@printf("true || false = %s\n", true || false ? "true" : "false")
@printf("!true = %s\n", !true ? "true" : "false")


# loops
i = 1
while i < 20
    if(i % 2) == 0
        println(i)
        global i += 1
        continue
    end
    global i+=1
    if i >= 10
        break
    end
end

for i = 1:5
    println(i)
end

for i in [2, 4, 6]
    println(i)
end

for i = 1:5, j = 2:2:10
    println((i, j))
end

# arrays
a1 = zeros(Int32, 2, 2)
a2 = Array{Int32}(undef, 5)
a3 = Float64[]
a4 = [1, 2, 3]

println(a4[1])
println(a4[end])
println(5 in a4)
println(findfirst(isequal(2), a4))
f(a) = (a >= 2) ? true : false
println(findall(f, a4))
println(count(f, a4))


println(size(a4))
print(length(a4))
println(sum(a4))
splice!(a4, 2:1, [8, 9])
println(a4)
splice!(a4, 2:3)
println(a4)
