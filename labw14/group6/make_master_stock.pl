# This protocol assumes six total primers in the oligo mix

argument
  oligonucleotides: sample array, "Select the oligonucleotides you want to make into a master stock"
end

n = length(oligonucleotides)
# The number of oligonucleotides to mix is recorded


take
  oligonuc = item oligonucleotides
  molecular_g_h2o = "Molecular Grade Water"
  tube = 1 "1.5 mL Eppendorf Tube"
end

step
  description: "This protocol describes how to create a master stock from desired oligonucleotides"
end

step
  description: "Label the 1.5 mL Eppendorf tube with your initials and date"
  note: "place the tube in a test tube rack"
end

step
  description: "Pipette 480 μL of Molecular grade water into the tube"
end

step
  description: "Add 10 μL of each primer stock into each tube"
end

produce
  master_stock = 1 "Primer Pool"

end




log
  return: { working_fragments: master_stock  }
end
