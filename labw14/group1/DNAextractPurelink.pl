#should set this up as an arg that takes the pellet, or at least premade suspension

step
  discription: "Extract DNA from clonal cells"
  check: "Set a water bath  to 55 C"
end

take
  1 "50mL 95% Ethanol Aliquot"
  1 "PureLink Genomic DNA Mini Kit"
end

step
  description: "Prepare the cell lysate"
  check: "DO SUSPENSION/CENTERFUGATION/POUROFF"
  check: "Pipette 180uL PureLink Genomic Digestion Buffer into the tube"
  check: "Pipette 20uL Proteinase K into the tube"
  check: "Vortex the tube breifly to mix"
end

step
  description: "Incubate the tube in the 55 C heat bath until lysis is complete (30min - 40 hours)"
  note: "Vortex occasionally"
end

step
  description: "Complete the lysate"
  check: "Pipette 20 uL RNase A into the tube.   Vortex briefly to mix."
  check: "Incubate at room tempurature for two minutes."
  check: "Pipette 200 uL PureLink Genomic Lysis/Binding Buffer. Vortex until solution is homogenous."
  check: "Pipette 200 uL 95% Ethanol into the tube.  Vortex the tube for 5 seconds"
end

step
  description: "Binding DNA"
  warning: "Check that the Genomic Wash Buffers 1 and 2 are labled as having ethanol added to them.  If they have not, do so now as instructed on the bottle."
  check: "Lable a PureLink Spin Column with your initials and the date."
  check: "Pipette the lysate (~640uL) into the column."
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
  check: "Cetrifuge the column at maximum speed for 1 minute at room tempurature."
end

step
  description: "Eluting DNA Part 2"
  check: "Replace the 1.5 ml tube on the collection tube. Discard the old tube."
  check: "Add 25 uL PureLink Genomic Elution Buffer to the column."
  check: "Incubate the tube for 1 minute at room tempurature."
  check: "Cetrifuge the column at maximum speed for 1 minute at room tempurature."
end

step
  description: "Binding DNA"
  warning: "Check that the Genomic Wash Buffers 1 and 2 are labled as having ethanol added to them.  If they have not, do so now as instructed on the bottle."
  check: "Lable a PureLink Spin Column with your initials and the date."
  check: "Pipette the lysate (~640uL) into the column."
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
  check: "Replace the 1.5 ml tube on the collection tube. Discard the old tube."
  check: "Add 25 uL PureLink Genomic Elution Buffer to the column."
  check: "Incubate the tube for 1 minute at room tempurature."
  check: "Cetrifuge the column at maximum speed for 1.5 minutes at room tempurature."
  check: "Remove and discard the 1.5 mL tube.  The collection tube contains purified DNA."
end

produce
  r = "Extracted DNA"
  location: "Bench"
end


