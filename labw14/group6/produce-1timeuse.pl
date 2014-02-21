produce
  new_gene = 1 "PCR Result" of "fLAB1"

end

log
  return: { PCR_Result_id: new_gene[:id] }
end
