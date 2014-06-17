a = 0
b = 0
while a < 3
  b = a+1
  step
    description: "In Loop: b=%{b}"
  end
  a = b
end

step
 description: "Done: b=%{b}"
end
