step
  description: "Put down the id generated in this protocol on your second gel slice tube."
end

ii = 0
r = []

while ii < 2
  produce
    y = 1 "Gel Slice" of "fGA"
  end
  r = append(r,y)
  ii = ii + 1
  #step
  # description: "Thanks"
  #end
end

step
  description: "r = %{r}"
end
