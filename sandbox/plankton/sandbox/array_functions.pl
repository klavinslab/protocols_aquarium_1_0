function print(A)
  s = ""
  foreach a in A 
    s = s + to_string(a) + "\\n"
  end
  step
    description: "Variable Values"
    note: "%{s}"
  end
end


a = [ 1, 2 ]
b = [ 2, 3, 4 ]
l = length(a)
c = append(a,3)
d = unique(concat(a,b))

print([a,b,c,d,l])
