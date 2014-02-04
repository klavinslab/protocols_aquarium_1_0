argument
  template: sample array, "prepicked liquied cultures from colonies"
  template_plate: sample, "your plate from last week"
end

take
  liquidtemplate = item template #an array
  platetemplate = item template_plate
end

step
  description: "Take 4 tubes from a PCR tube strip and label them 1 through 4 on the side, also write your initials on it." 
end

step
  description: "Add 20 μL molecular grade water to tube 1-4"
end

t1= template[0]
t2= template[1]
step
  description: "Take 1 μL from tube with id %{t1} and transfer it to tube 1"
end
step
  description: "Take 1 μL from tube with id %{t2} and transfer it to tube 2"
end

step
  description: "Pick a colony from the plate sector 3 and put it into tube 3"
  note: "Find a colony in your plate sector 3 and pick up the entire colony with a 200 μL (green box) pipette tip.  Then transfer it to tube 3."
end
step
  description: "Pick a colony from the plate sector 4 and put it into tube 4"
  note: "Find a colony in your plate sector 4 and pick up the entire colony with a 200 μL (green box) pipette tip.  Then transfer it to tube 4."
end

step
  description: "Save some cells for later"
  check: "Labe two 1.5 mL tubes with your initials, date. Write save3 the first tube and save4 on second tube."
  check: "Add 1 mL of LB+Kan into the each tube."
  check: "Take 1 μL from tube 3 and put it into tube save3."
  check: "Take 1 μL from tube 4 and put it into tube save4."
end
#TODO: fix up the above

step
  description: "Place the tube 1-4 into thermal cycler T2 at B3.335"
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
  description: "Open the lid and take the four PCR tubes you placed."
  note: "Place the tube on your bench, these four tubes will be used as your boiled cell 1-4 for the following reaction setup."
end
#produces 4 templates.  each template has 3 primers and 2 reactions (f+r1,f+r2)

modify
  liquidtemplate[0]
  location: "Bench"
end
modify
  liquidtemplate[1]
  location: "Bench"
end

release liquidtemplate
release platetemplate


