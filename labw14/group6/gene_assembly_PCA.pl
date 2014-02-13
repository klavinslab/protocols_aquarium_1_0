argument
  oligo_pool: sample array, "Select the oligonucleotide stocks you want to combine through gene assembly"
end

n = length(oligo_pool)
# The number of oligo pools to use in the assembly is recorded, just in case


take
  masterstock = item oligo_pool
  molecular_g_h2o = "Molecular Grade Water"
  
end

step
  description: 
    "This protocol describes how to run gene assembly of two oligonuleotide stocks"
end

step
  description: ""
  note: ""
end



produce
  new_gene = 1 "PCR Result"

end




log
  return: { gene: new_gene  }
end
