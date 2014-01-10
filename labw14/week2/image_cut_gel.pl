argument
  Gel_Lane_id: sample, "The gel lane you got after run the gel"
end

produce
  r = "Gel Slice in 1.5 mL tube" of "fLAB2"
  location = "Bench"
end

log
  return: {Gel_Slice_id: r[:id]}
end
