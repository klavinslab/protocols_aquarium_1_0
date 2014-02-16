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
  return: { PCR_Result_id: master_stock[:id]}
end
