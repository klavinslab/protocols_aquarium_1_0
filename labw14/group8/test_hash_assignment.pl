a = "hello"
ha = { hi: "there", foo: 2}

step
  description: "Demonstrate hash assignment"
end

ha[a] = "again"
x = ha[:a]

step
  description: "What values does x have?"
  note: "%{x}"
end
