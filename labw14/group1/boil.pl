argument
  pGenome: sample, "Purified Genome"
end

take
  pGenome_1 = item pGenome[:id]
end

first = 1
last = 4

step
  description: "Take 4 tubes from a PCR tube strip and label them %{first} through %{last} on the side, also write your initials on it." 
end

step
  description: "Add 20 µL molecular grade water to each tube %{first} - %{last}"
end


step
  description: "Take 1 µL from purified Genome tube and transfer it to all PCR tubes labeled %{first} - %{last}"
end

step
  description: "Save some cells for later"
  check: "Labe two 1.5 mL tubes with your initials, date. Write save1 the first tube and save2 on second tube."
  check: "Add 1 mL of LB+Kan into the each tube."
  check: "Take 1 µL from purified Genome tube and put it into tube save1."
  check: "Take 1 µL from  purified Genome tube and put it into tube save2."
end


step
  description: "Place the pcr tube %{first} - %{last} into thermal cycler T2 at B3.335"
end

step
  description: "Choose program on the thermal cycler"
  check: "Click Home then click Saved Protocol, choose LABW14 folder, choose BOIL."
  check: "Close the lid and click start."
  check: "Choose 20 µL option."
  image: "thermal_cycler_home"
end
step
  description: "Wait for 12 minutes for the cells to boil"
	timer: { hours: 0, minutes: 12, seconds: 0 }
end

step
  description: "Open the lid and take the PCR tubes you placed."
  note: "Place tubes on your bench, these tubes will be used as your boiled cell %{first} - %{last} for the following reaction setup."
end


modify
  pGenome_1[0]
  location: "Bench"
end
release pGenome_1 
