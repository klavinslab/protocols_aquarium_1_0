argument
  primer1: sample, "The first primer"
  primer2: sample, "The second primer"
  plasmid_id: sample, "The plasmid stock"
end

step
    description: "PCR Protocol"
end

produce
  r = 1 "PCR Result" of "fLAB2"
  note: "Check the upcoming job time. (no need to edit the location below)"
  location: "Thermal Cycler"
end

log
  return: { PCR_Result_id: r[:id]}
end

