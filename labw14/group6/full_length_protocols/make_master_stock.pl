# This protocol assumes six total primers in the oligo mix

argument
  oligonucleotides: sample array, "Select the oligonucleotides you want to make into a master stock"
end

n = length(oligonucleotides)
# The number of oligonucleotides to mix is recorded

x: Volume_total = 600 μL
y: Volume_per_oligo = 10 μL
z: volume_water = x - n * y 

take
  oligonuc = item oligonucleotides
  molecular_g_h2o = 1 "Molecular Biology Grade Water"
end

step
  description: "This protocol describes how to make a primer pool from desired oligonucleotides"
  
end


step
  description: "Label a 1.5 mL Eppendorf tube with your initials and date"
  note: "Place the tube in a test tube rack"
  
end

step
  description: "Pipette %{z} μL of Molecular Grade Water into the tube"
  
end

step
  description: "Add 10 μL from each oligonucleotides into the tube."
  
end


produce
  master_stock = 1 "Primer Pool"

end

log
  return: { working_fragments: master_stock  }
end

release [oligonuc]
release [molecular_g_h2o]
