require "plankton/standard.pl"

g = { a: 1, b: "hello" }
h = { a: 2, c: "goodbye" }
i = merge(g,h)

print("key(g,:c)",key(g,:c))
print("g",g)
print("h",h)
print("i",i)

q = :a

print("g[q]",g[q])
print("keys",keys(g))

j = delete(h,:a)

print("j",j)
