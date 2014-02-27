step
  description: "Put down the id generated in this protocol on your second gel slice tube."
end

produce
  r = 1 "Gel Slice" of "fGA"
end

log
  return: {Gel_Slice_id: r[:id]}
end
