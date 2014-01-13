step
  description: "Pick up the tube you incubated on the 50 C heat block"
  note: "Place on your bench after you picked up"
end

produce
  r = 1 "Gibson Reaction Result" of "pLAB3"
  note: "Keep the tube on the bench to use in the next protocol. (no need to edit the location below)"
  location: "Bench"
end

log
  return: { Gibson_Reaction_Result_id: r[:id]}
end
