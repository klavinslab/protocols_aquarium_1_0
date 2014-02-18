argument
    oligo_pool1: sample, "Choose the first oligonucleotide master stock"
    oligo_pool2: sample, "Choose the second oligonucleotide master stock"
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
