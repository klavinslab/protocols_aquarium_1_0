argument
  gel: sample array, "Choose the Gel Slices you need to purify."
end

take
  gel_slices = item gel
end

produce
  r = 2 "Fragment Stock" 
  location: "Bench"
  release gel_slices
end

log
  return: {Fragment_Stock_id: r[:id]}
end
