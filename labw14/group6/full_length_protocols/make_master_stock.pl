# This protocol assumes six total primers in the oligo mix

argument
  oligonucleotides: sample array, "Select the oligonucleotides you want to make into a master stock"
  #Concentrated_Stock1: string, "Unique sample name of the concentrated stock."
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
  description: "This protocol describes how to make a primer pool from desired oligonucleotides."
  
end


step
  description: "Label a 1.5 mL Eppendorf tube with your initials and date."
  note: "Place the tube in a test tube rack."
  
end

step
  description: "Pipette %{z} μL of Molecular Grade Water into the tube."
  
end

step
  description: "Add 10 μL from each %{n} oligonucleotide(s) into the 1.5 mL Eppendorf tube."
  
end


produce
  master_stock = 1 "Working Stocks" of "OsGH3.1-1_1-6"

end

release concat (oligonuc, molecular_g_h2o)

log
  return: { Working_Stocks_id: master_stock[:id]  }
end
