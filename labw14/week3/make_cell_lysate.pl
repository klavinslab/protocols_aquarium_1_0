argument
  Transformed_E_coli_Strain_id, sample, "Choose the plate that you want to do colony PCR."
end

take
  y = item Transformed_E_coli_Strain_id
end

step
  description: "Label two 0.2mL PCR tubes. Write your initials on both."
  note: "On one tube write CW for cell water and on the other write B for boil"
end

step
  description: "Prepare cell water solution"
  note: "This step makes an isotonic solution to temporarly keep cells in while you do the colony PCR"
  check: "Add 40 µL of PBS (phosphate buffered saline) in the cell water tube"
  check: "Use 10 µL pipette tip to pick a colony from the plate and add into the tube with swirl the tips several times."
end

step
  description: "Transfer 20 µL cell water to boil tube"
end

step
  description: "Place the boil tube in the thermal cycler"
  note: "Find and initiate the boil protocol on the thermal cycler"
end

# produce the cell water



