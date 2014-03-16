a = "hello"
ha = { hi: "there", foo: 2}

step
  description: "Demonstrate hash assignment"
end

ha[a] = "assigning to a string variable works"
x = ha[:hello]

step
  description: "What values does x have?"
  note: "%{x}"
end

ha[:hello] = "reading from a string variable works"
x = ha[a]

step
  description: "What values does x have?"
  note: "%{x}"
end
