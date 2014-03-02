# This protocol assumes six total primers in the oligo mix

argument
  oligonucleotides: sample array, "Select the oligonucleotides you want to make into a master stock"
  Concentrated_Stock: string, "Unique sample name of the concentrated stock."
end

n = length(oligonucleotides)
# The number of oligonucleotides to mix is recorded

x = 600 
# volume total
y = 10
# volume_per_oligo
z =  x - n \* y 
# volume water

take
  oligonuc = item oligonucleotides
  molecular_g_h2o = 1 "Molecular Biology Grade Water"
end

step
  description: "This protocol describes how to make a stock mixtures from desired oligonucleotides."
  
end


step
  description: "Label a 1.5 mL Eppendorf tube with your initials and date."
  note: "Place the tube in a test tube rack."
  image: "Group6_label"
  
end

step
  description: "Pipette %{z} µL of Molecular Grade Water into the tube."
  image: "Group6_water_tube"
  
end

step
  description: "Add 10 µL from each %{n} oligonucleotides into the labeled 1.5 mL Eppendorf tube."
  note: "The order is not important."
  
end


produce
  master_stock = 1 "Working Stock" of Concentrated_Stock

end

release concat (oligonuc, molecular_g_h2o)

log
  return: { Working_Stock_id: master_stock[:id]  }
end
