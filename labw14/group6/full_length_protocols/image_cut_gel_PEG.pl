step
  description: "Put down the id generated in this protocol on your second gel slice tube."
end

produce
  r = 1 "Gel Slice" of "fGA"
end

produce 
  q = 1 "Gel Slice" of "fGA"
end

q = append (q,r[:id])

log
  return: {Gel_Slice_id: q}
end
