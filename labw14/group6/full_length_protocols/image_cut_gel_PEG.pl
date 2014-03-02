step
  description: "Put down the id generated in this protocol on your second gel slice tube."
end

ii = 0
r = []

while ii < 3
  produce
    y = 1 "Gel Slice" of "fGA"
end
  r = append(r,y[:id])
  ii = ii + 1
end

log
  return: {Gel_Slice_id: r}
end


