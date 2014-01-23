argument
  Transformed_E_coli_Strain_id: sample, "Choose the plate that you want to do colony PCR."
end

take
  y = item Transformed_E_coli_Strain_id
end

step
  description: "Label a 0.2mL PCR tube. Write your initials on it."
end

step
  description: "Prepare cell water solution"
  note: "This step makes an isotonic solution to temporarly keep cells in while you do the colony PCR"
  check: "Add 40 µL of PBS (phosphate buffered saline) in the tube"
  check: "Use 10 µL pipette tip to pick a colony from the plate and add into the tube with swirl the tips several times."
end


step
  description: "Place the tube into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  check: "Click Home then click Saved Protocol, choose LABW14 folder, choose BOIL."
  check: "Close the lid and click start."
  image: "thermal_cycler_home"
end

step
  description: "Wait for 10 minutes for the cells to boil"
  timer: { hours: 0, minutes: 10, seconds: 0 }
end

release y

produce
  r = 1 "Cell Lysate" of "pLAB3 in Z1"
  note: "Keep the tube on the bench to use in the next protocol. (no need to edit the location below)"
  location: "Bench"
end

log
  return: {Cell_Lysate_id: r[:id]}
end
# produce boiled cell water


