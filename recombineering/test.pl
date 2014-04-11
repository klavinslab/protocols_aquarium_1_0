thing = {}
thing[:xx] = 37
thing["abc"] = 200
thing2 = {omg: 333}
thing[thing2] = 74763
q = 2345
thing[q] = "hello"

bar = thing[thing2]
step
  note: "foo %{thing}, %{bar}"

end
