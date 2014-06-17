function print(name,val)
  step
    description: "%{name} = %{val}"
  end
end

y = { a: 1, b: [2, 3] }
x = [ 1, 2, 3, 4, 5 ]
x[x[1]+y[:b][0]] = "hello"

print("x",x)

h = {}

h[:a] = 1
h[:b] = [ 2, 3 ]
h[:b][0] = -3

print("h",h)

