argument
  Transformed_E_coli_Strain_id, sample, "Choose the plate that you want to do colony PCR."
end

take
  y = item Transformed_E_coli_Strain_id
end

step
  description: "Label a 0.2mL PCR tube. Write your initials on it."
end

step
  description: "Prepare cell lysate reaction"
	check: "Add 40 µL of molecular grade water in the tube"
	check: "Use 10 µL pipette tip to pick a colony from the plate and add into the tube with swirl the tips several times." 
end



