argument
  template: sample array, "prepicked liquied cultures from colonies"
  template_plate: sample, "your plate from last week"
end

take
  liquidtemplate = item template #an array
  platetemplate = item template_plate
end

step
  description: "Take 4 tubes from a PCR tube strip and label them 1 through 4 on the side." 
end

step
  description: "add 20 ul molecular grade water to tubes 1-4"
end

t1= template[0]
t2= template[1]
step
  description: "take 1 ul from tube %{t1} and transfer it to tube 1"
end
step
  description: "take 1 ul from tube %{t2} and transfer it to tube 2"
end

step
  description: "Pick a colony from the plate sector 3 and put it into tube 3"
  note: "Find a colony in your plate sector 3 and pick up the entire colony with a 200 ul (green box) pipette tip.  Then transfer it to tube 3."
end
step
  description: "Pick a colony from the plate sector 4 and put it into tube 3"
  note: "Find a colony in your plate sector 4 and pick up the entire colony with a 200 ul (green box) pipette tip.  Then transfer it to tube 4."
end

step
  description: "Save some cells for later"
  check: "take 1ul from tube 3 and put it into a 1.5ml tube of LB+kan"
  check: "take 1ul from tube 4 and put it into a 1.5ml tube of LB+kan"
end
#TODO: fix up the above

step
  description: "boil at 95 degrees"
  note: "coordinate with another group and boil your cells (tubes 1-4) at 95 degrees in the thermocycler using program XXXXFILL ME INXXXX"
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



