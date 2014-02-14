argument
  gel: sample, "The gel lane you got after run the gel"
end

step
  description: "test."
end

produce
  r = 1 "Gel Slice"
  release y
end

log
  return: {Gel_Slice_id: r[:id]}
end
