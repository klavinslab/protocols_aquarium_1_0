argument
  gel_slice1: sample, "Choose the first gel slice you need to purify."
  gel_slice2: sample, "Choose the second gel slice you need to purify."
end

step
    description: "Testing step"
end

produce
  r = 2 "Purified Fragments" 
  location: "Bench"
end

log
  return: { Purified_Fragments_id: r[:id]}
end
