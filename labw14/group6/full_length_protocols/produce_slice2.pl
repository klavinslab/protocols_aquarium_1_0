argument
  gel_lane: sample, "The gel lane you got after run the gel"
end

produce
  t = 1 "Gel Slice" of "fGA"
end

log
  return: {Gel_Slice_id: t[:id]}
end
