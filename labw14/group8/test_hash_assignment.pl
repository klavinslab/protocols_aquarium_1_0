a = "testkey"
ha = { hi: "there", foo: 2}

step
  description: "Demonstrate hash assignment"
end

ha[a] = "assigning to a string variable works this way"
x = ha[:testkey]
y = ha[a]

step
  description: "Maybe says assigning to a string variable works this way twice"
  note: "%{x} %{y}"
end

ha[:testkey] = "reading from a string variable works"
x = ha[a]

step
  description: "Maybe reading from a string variable works this way"
  note: "%{x}"
end
