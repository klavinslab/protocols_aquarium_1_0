##This protocol makes 80 gibson aliquots

argument
  iso_buffer: sample("Enzyme"), "Choose an aliquot of 5X ISO Buffer to use for this protocol."
  t5: sample("Enzyme"), "Choose a tube T5 Exonuclease to use in this protocol."
  phusion_pol: sample("Enzyme"), "Choose a tube of phusion polymerase to use in this protocol."
  ligase: sample("Enzyme"), "Choose a tube of Taq DNA Ligase to use in this protocol"
end

step
  description: "This protocol makes 80 gibson aliquots. Make sure you keep all associated enzyme in this prtocol ON ICE through the duration of the WHOLE PROTOCOL."
end

step
  description: "Grab a sample cooling block from SF2 and place all items retrieved in the next take in it."
end

take
 MGh2o = 1 "Molecular Biology Grade Water"
 iso = item iso_buffer
 t5_ex = item t5
 phusion = item phusion_pol
 lig = item  ligase
end

step
  description: "Grab a new 1.5 ml eppendorf tube and place it into the sample ice block"
end

step
  description: "Pipette 320µl of the 5X ISO buffer into the new eppendorf tube."
end

step
  description: "Pipette 0.64µl of the T5 exonuclease into the eppendorf tube. Remember to keep all associated samples on the ice block."
end

step
  description: "Pipette 20µl of the Phusion DNA Polymerase into the eppendorf tube."
end

step
  description: "Pipette 160µl of the Taq DNA Ligase into the eppendorf tube."
end

step
  description: "Add 699µl of MG H2O to the tube."
end

step
  description: "Grab 80 small sample tubes and another ice block with a 96well metal plate"
end

step
  description: "Gently mix the eppendorf tube until contents are well mixed."
end

step
  description: "Aliquot 15µl of the eppendorf tube contents into each of the 80 small sample tubes"
end

produce
  r = 80 "Gibson Aliquot"
  release iso
end

log
  return: {aliquot_id: r[:id]}
end

release [ MGh2o[0], t5_ex[0], phusion[0], lig[0]]



