argument
  fragment_gel_lanes: sample, "The gel lane you got after run the gel"
end

step
  description: "test."
end

produce
  r = 2 "Gel Slices"
end

log
  return: { Gel_Slices_id: r[:id]}
end
