argument
  volume: number, "The elution volume in ul"
  strain_id: sample("Plasmid"), "An E. coli overnight of the plasmid to be purified"
end

step
  description: "This protocol isolates plasmid DNA from an overnight culture of transformed E. coli"
end

take
  overnight = item strain_id
end

y=length(strain_id)

step
  description: "Grab %{y} eppendorf tubes and label them"
  note: "Label the top of the tubes 1, 2, 3, ... , %{y}"
end


x=0
while x < y
  a=strain_id[x]
  z=x+1
  step 
    description: "Pipet 1000 uL of plasmid with id %{a} into tube %{z}."
  end
  x = x+1
end

step
  description: "Spin down the cells"
  note: "Spin at 5,800Xg for 2 minutes"
  warning: "Make sure to balance the centrifuge. If you have an odd number of samples, use a balance tube with water"
end

step 
  description: "Remove the supernatant"
  note:"Pour off the supernaant into liquid waste, being sure not to upset the pellet. Pipette out the residual supernatant"
end

step 
  description: "Resuspend in P1"
  note:"Pipette 250 ul of P1 into each tube and vortex strongly to resuspent"
end

step 
  description: "Add P2 and gently invert to mix"
  note:"Pipette 250 ul of P2 into each tube and gently invert 10 times to mix. Tube contents should turn blue."
  warning:"This step should be done rapidly. Cells should not be exposed to active P2 for more than 5 minutes"
end

step 
  description: "Add N3 and gently invert to mix"
  note:"Pipette 350 ul of N3 into each tube and gently invert 10 times to mix. Tube contents should turn colorless."
end

step
  description: "Spin tubes and set up columns and final tubes"
  note: "Spin at 17,000Xg for 10 minutes"
  warning: "Make sure to balance the centrifuge. If you have an odd number of samples, use a balance tube with water"
  check: "Grab %{y} purple miniprep spin columns"
  check: "Label the side of the columns 1, 2, 3, ... , %{y}"
  check: "Grab %{y} new eppendorf tubes"
  check: "Label the top of the tubes 1, 2, 3, ... , %{y}"
end

step 
  description: "Carefully pour the supernatant into the columns"
  note:"The contents of tube 1 should be poured into column 1, the contents of tube 2 should be poured into column 2, ..."
end

step 
  description: "Spin the columns"
  note:"Spin at 17,000Xg for 1 minute"
end

step 
  description: "Wash the column with PE buffer"
  check: "Remove the columns from the centrifuge and discard the flow through into a liquid waste container"
  warning: "Make sure the PE bottle that you are using as ethanol added!"
  check: "Add 750 ul of PE buffer to each column."
  check: "Close the PE bottle tightly."
  check: "Spin the columns at 17,000Xg for 1 minute"
end

step 
  description: "Perform a final spin to fully dry the columns"
  check: "Remove the columns from the centrifuge and discard the flow through into a liquid waste container"
  check: "Spin the columns at 17,000Xg for 1 minute"
  check: "During the spin, open the clean eppendorf tubes labeled 1 - %{y}"
end

step 
  description: "Elute with water"
  check: "Remove the columns from the centrifuge"
  check: "Inidividually take each column out of the flowthrough collector and put it into the open eppendorf tube of the same number."
  warning: "For this step, use a new pipette tip for each sample to avoid cross contamination"
  check: "Pipette %{volume} ul of water into the CENTER of each column"
  check: "Let the tubes sit on the bench for 5 minutes"
  check: "Spin the columns at 17,000Xg for 1 minute"
  check: "Remove the tubes and discard the columns"
end

step 
  description: "Re-label the final tubes"
  note: "In the next %{y} screens, you will see the ID numbers of each sample in order. Write this number on a white tube cap sticker and stick it on the tube over the previously written number."
end

x=0
while x < y
  produce
    q = 1 "PCR Result" of strain_id[x](____NAME____)
  end
  x = x+1
end

release overnight
