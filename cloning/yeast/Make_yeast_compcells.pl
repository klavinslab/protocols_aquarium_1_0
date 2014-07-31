argument
  cultures_id: sample array, "The 50ml cultures to make comp cells out of"
end

take
  liac = 1 "100 mM LiOAc"
  water = 1 "50 mL Molecular Grade Water aliquot"  
end


step
  description: "Harvesting cells"
  check: "Get flask with the following labels from the 30C incubator"
  table: [culture_id] 
end
