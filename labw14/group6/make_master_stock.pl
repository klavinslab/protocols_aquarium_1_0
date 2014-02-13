argument
  oligonucleotides: sample array, "Select the oligonucleotides you want to make into a master stock"
end

n = length(oligonucleotides)
# The number of oligonucleotides to mix is recorded


take
  oligonuc = item oligonucleotides
  molecular_g_h2o = "Molecular Grade Water"
  
end

step
  description: 
    "This protocol describes how to create a master stock from desired oligonucleotides"
end

step
  description: ""
  note: ""
end



produce
  master_stock = 1 "Plasmid Pool"

end




log
  return: { working_fragments: master_stock  }
end
