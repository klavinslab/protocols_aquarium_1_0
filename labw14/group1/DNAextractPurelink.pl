argument
  susp: sample, "Overnight Suspension of your cells"
end


step
  description: "Extract DNA from clonal cells"
  note: "Before beginning the process, set a hot water bath to 55 C"
end

take
 susp = item susp[:id]
 kit = 1 "PureLink Genomic DNA Mini Kit"
end

step
 description: "Desuspend the cells"
 check: "Lable two 1.5ml tubes with your initials and the date."
 check: "Pipette 1.5mL of from the overnight suspension into each tube."
 check: "Centrifuge the tubes at 4000g for 1 minute."
 check: "Carefully use pipette to remove and discard the supernatant from each tube."
 check: "Repeat the centrifuge and seperation step 3-4 more times with each tube."
end

step
  description: "Prepare the cell lysate"
  check: "Pipette 180uL PureLink Genomic Digestion Buffer into the tube"
  check: "Pipette 20uL Proteinase K into the tube"
  check: "Vortex the tube breifly to mix"
end

step
  description: "Incubate the tube in the 55 C heat bath until lysis is complete (usually 40 - 50 minutes)"
  note: "Place the tube in a green tube rack to hold it steady."
  note: "Vortex occasionally."
end

step
  description: "Complete the lysate"
  check: "Pipette 20 uL RNase A into the tube. Vortex briefly to mix."
  check: "Incubate at room tempurature for two minutes."
  check: "Pipette 200 uL PureLink Genomic Lysis Binding Buffer. Vortex until solution is homogenous."
  check: "Pipette 200 uL 95%% Ethanol into the tube.  Vortex the tube for 5 seconds"
end

step
  description: "Binding DNA"
  warning: "Check that the Genomic Wash Buffers 1 and 2 are labled as having ethanol added to them.  If they have not, do so now as instructed on the bottle."
  check: "Lable a PureLink Spin Column with your initials and the date."
  check: "Pipette the lysate (around 640uL) into the column."
  check: "Centrifuge the column at 10,000g for 1 minute at room tempurature."
  check: "Discard the column's collection tube and replace it with a clean one."
end

step
  description: "Washing DNA"
  check: "Pipette 500 uL PureLink Genomic Wash Buffer 1 into the column."
  check: "Centrifuge the column at 10,000g for 1 minute at room tempurature."
  check: "Discard the column's collection tube and replace it with a clean one."
end

step
  description: "Washing DNA Part 2"
  check: "Pipette 500 uL PureLink Genomic Wash Buffer 2 into the column."
  check: "Centrifuge the column at maximum speed for 3 minutes at room tempurature."
  check: "Discard the column's collection tube."
end

step
  description: "Eluting DNA"
  check: "Place the spin column in a 1.5 ml tube."
  check: "Add 25 uL PureLink Genomic Elution Buffer to the column."
  check: "Incubate the tube for 1 minute at room tempurature."
  check: "Cetrifuge at maximum speed for 1 minute at room tempurature."
end

step
  description: "Eluting DNA Part 2"
  check: "Add an additional 25 uL PureLink Genomic Elution Buffer to the column."
  check: "Incubate the tube for 1 minute at room tempurature."
  check: "Cetrifuge the column at maximum speed for 1.5 minutes at room tempurature."
  check: "Remove and discard the column.  The 1.5mL tube contains purified DNA."
end

produce
  r = 1 "Transformed E coli 1.5 mL tube" from susp[0]
end

#release kit

#end

log
 return: {r: r}
end


