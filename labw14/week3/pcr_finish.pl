step
  description: "Go to the thermal cycler to pick up the PCR tube you put in the previous pcr_prepare protocol."
  note: "Put it on you bench after you picked up the PCR tube"
end

produce
  r = 1 "PCR Result" of "fLAB3"
  note: "Keep the tube on the bench to use in the next protocol. (no need to edit the location below)"
  location: "Bench"
end

log
  return: { PCR_Result_id: r[:id]}
end
