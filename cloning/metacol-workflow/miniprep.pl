argument
  volume: number, "The elution volume in ul"
  strain_id: sample array, "An E. coli overnight of the plasmid to be purified"
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


tbl = [["Tube Label", "Overngiht Culture ID"]]
ii = 0 
while ii<y
  tbl = append(tbl,[ii+1,strain_id[ii]])
  ii = ii+1
end

step
  description: "Pipet 1000 µl of culture from the overnight culutres into the corresponding tubes."
  table: tbl
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
  description: "Be sure to check the boxs as you complete each step."
  check: "Add P2 and gently invert to mix"
  check:"Pipette 250 ul of P2 into each tube and gently invert 10 times to mix. Tube contents should turn blue."
  warning:"This step should be done rapidly. Cells should not be exposed to active P2 for more than 5 minutes"
  check: "Add N3 and gently invert to mix"
  check:"Pipette 350 ul of N3 into each tube and gently invert 10 times to mix. Tube contents should turn colorless."
  check: "Spin tubes and set up columns and final tubes"
  check: "Spin tubes at 17,000Xg for 10 minutes"
  warning: "Make sure to balance the centrifuge. If you have an odd number of samples, use a balance tube with water"
  check: "Meanwhile, prep and label all of the columns and tubes you will need for the rest of the protocol"
  check: "Grab %{y} blue miniprep spin columns"
  check: "Label the side of the columns 1, 2, 3, ... , %{y}"
  check: "Grab %{y} new eppendorf tubes"
  check: "Label the top of the tubes 1, 2, 3, ... , %{y}"
end

step 
  description: "Carefully pour the supernatant into the columns"
  note:"The contents of tube 1 should be poured into column 1, the contents of tube 2 should be poured into column 2, ..."
end

step 
  description: "Be sure to check the boxs as you complete each step."
  check: "Spin the columns"
  check:"Spin at 17,000Xg for 1 minute"
  warning: "Again, make sure the the centrifuge is balanced. Use an extra column with 500 ul of water if necessary"
  check: "Wash the column with PE buffer"
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
  description: "Go to B9 and nanodrop all of the plasmid stocks created. Record the concentrations on the side of the tubes."
end

x=0
concs=[]
while x < y
  z=x+1
  step
    description: "Enter the concentrations of each miniprep tube."
    note: "Concentration for tube %{z} in ng/µl"
      getdata
        conc: number, "Enter the recorded DNA concetrations on tube %{z}"
      end
  end
  concs[x]=conc
  x=x+1
end

step 
  description: "Re-label the final tubes"
  note: "In the next %{y} screens, you will see the ID numbers of each sample in order. Write this number on a white tube cap sticker and stick it on the tube over the previously written number."
end

miniprep_ids =[]
x=0
while x < y
  produce
    q = 1 "Plasmid Stock" from overnight[x]
    data
      concentration: concs[x]
    end
  end
  miniprep_ids=append(miniprep_ids,q[:id])
  x = x+1
end


release overnight

log
  return: {miniprep_ids: miniprep_ids}
end

