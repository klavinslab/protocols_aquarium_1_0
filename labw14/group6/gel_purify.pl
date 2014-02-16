argument
  gel_slices: sample array, "Choose the Gel Slices you need to purify."
end

step
    description: "Testing step"
end

produce
  r = 2 "Purified Fragments" 
  location: "Bench"
  release gel_slices
end

log
  return: {Purified_Fragments_id: r[:id]}
end
