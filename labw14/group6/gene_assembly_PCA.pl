argument
    oligo_pools1: sample array, "Choose the first oligonucleotide master stocks"
    oligo_pools2: sample array, "Choose the second oligonucleotide master stocks"
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
