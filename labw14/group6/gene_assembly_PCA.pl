argument
    oligo_pools: sample array, "Choose the oligonucleotide master stocks"
end

step
    description: "Testing step"
end

produce
  master_stock = 1 "PCR Result"

end

log
  return: { gene: master_stock  }
end
