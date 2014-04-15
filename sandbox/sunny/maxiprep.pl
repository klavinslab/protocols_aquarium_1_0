argument
  volume: number, "The elution volume in ul"
  strain_id: sample("Plasmid") array, "An E. coli overnight of the plasmid to be purified"
end

step
  description: "This protocol isolates plasmid DNA from an overnight culture of transformed E. coli"
end

take
  overnight = item strain_id
end

y=length(strain_id)

step
  description: "Grab %{y} 1 L centrifuge tubes and label them"
  note: "Label the top of the tubes 1, 2, 3, ... , %{y}"
end


x=0
while x < y
  a=strain_id[x]
  z=x+1
  step 
    description: "Pour 150 mL of culture with id %{a} into tube %{z}."
    note: "Make each tube has the same amount"
  end
  x = x+1
end

step
  description: "Spin down the cells in cetrifuge"
  note: "Spin at 4,000Xg for 15 minutes at 4 degrees C."
  warning: "Make sure to balance the centrifuge. If you have an odd number of samples, use a balance tube with water"
end

step 
  description: "Remove the supernatant"
  note:"Pour off the supernatant into liquid waste, being sure not to upset the pellet."
end

step 
  description: "Resuspend in 10 mL P1"
  note:"Pipette 10 ml of P1 into each tube and vortex strongly to resuspend"
end

step 
  description: "Add 10 mL buffer P2 and invert to mix"
  note:"Pipette 10 mL of P2 into each tube and gently invert 10 times to mix. Tube contents should turn blue if LyseBlue reagent is present."
  warning:"This step should be done rapidly. Cells should not be exposed to active P2 for more than 5 minutes"
end

step 
  description: "Add 10 mL chilled Buffer P3 and gently invert to mix"
  note:"Pipette 10 mL of prechilled N3 into each tube and gently invert until mixed thouroughly. Tube contents should turn colorless."
end

step
  description: "Screw the cap onto the outlet nozzle of the QIAfilter Cartride. Do this %{y} times"
end

step 
  description: "Pour the lysate into the barrel of the QIAfilter cartridge"
  note: "Use a pipette tip to try and block cell debris from entering the barrel of the cartridge. Incubating for 10 minutes will allow any cell debris that entered the column to float to the top of the column"
  check:"The contents of tube 1 should be poured into column 1, the contents of tube 2 should be poured into column 2, ..."
end

step 
  description: "Equilibrate a HiSpeed Tip with 10 mL buffer QBT, allowing it to enter the resin."
  note:"Use a tip holder over a beaker to catch the buffer flowthrough. "
end

step 
  description: "Remoce the cap from the QIAfilter Cartridge outlet nozzle. Gently insert the plunger into the QUAfilter Cartridge, and filter the cell lysate into the equilivrated HiSpeed Tip."
  note:"Continue adding lysate and filtering through the cartridge until all the lysate has been used."
end

step 
  description: "After the lysate has entered, wash the HiSpeet Tip with 60 mL Buffer QC"
end

step 
  description: "Elute DNA with 15 mL Buffer QF."
end

step 
  description: "Precipitate DNA by adding 10.5 mL isopropanol, mix and incubate for 5 mins."
end

step 
  description: "During the incubation, remove the plunger from a 30 mL syringe and attach the QIAprecipitator module onto the outlet nozzle."
end

step 
  description: "Place the QIAprecipitator from the syringe and pull out the plunger. Reattach the QIAprecipitator and add 2 mL 70% ethanol to the syringe. Wash the DNA by inserting the plunger and pressing the ethanol through the QIA precipitator."
end

step 
  description: "Remove the QIA precipitator from the syringe and pull out the plunger. Attach the QIAprecipitator again, insert the plunger, and dry the membrane by pressing air through the QIAprecipitator forcefully. Repeat this step several times."
end

step 
  description: "Dry the outlet nozzle of the QIAprecipitator with adsorbent paper"
end

step 
  description: "Remove the plunger from a new 5 mL syringe, attach the QIA precipitator and holf the outlet over a 1.5 mL collection tube. Add 1 mL Buffer TE to the 5 mL syringe. Insert the plunger and elute the DNA into the collection tube using constant pressure."
end

step 
  description: "Remove the QIAprecipitator from the 5 mL syringe, pull out the plunger and re-attach the QIAprecipitator to the 5 mL syringe."
end

step 
  description: "Transfer the eluate from back into the 5 mL syringe and eulte for a second time into the same 1.5 mL tube."
end


step 
  description: "Re-label the final tubes"
  note: "In the next %{y} screens, you will see the ID numbers of each sample in order. Write this number on a white tube cap sticker and stick it on the tube over the previously written number."
end

x=0
while x < y
  produce
    q = 1 "Plasmid Stock" from overnight[x]
  end
  x = x+1
end

release overnight
