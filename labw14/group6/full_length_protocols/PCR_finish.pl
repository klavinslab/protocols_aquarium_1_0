

step
  description: "Go to the thermal cycler and pick up the product of the PCA."
  note: "And place the tube at your bench"
end



produce
  r = 1 "PCR Result" of "fGA"

end

produce
  s = 1 "PCR Result" of "fGA"

end

release phusion_stock
release primer1_stock
release primer2_stock
release masterstock1
release masterstock2

log
  return: { PCR_Result_id1: r[:id] }
end

log
  return: { PCR_Result_id2: s[:id] }
end
