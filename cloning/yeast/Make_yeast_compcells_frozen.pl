argument
  cultures_id: sample array, "The 50ml cultures to make comp cells out of"
  aliquots_number: number array, "Number of comp cell aliquots you want made from each 50ml culture"
end


take
  FCC = 1 "50ml Frozen Competent Cell Solution aliquot"
  water = 1 "50 mL Molecular Grade Water aliquot" 
  cultures = item cultures_id
end

foreach x in cultures_id
  step
    description: "Harvesting cells"
    check: "Get flask labeled %{x} from the 30C incubator"
    check: "Pour contents of flask into a sterile 50ml plastic falcon tube"
    check: "Label the falcon tube %{x}."
    check: "Label 6 1.5ml ependorf tubes %{x} and set aside in a rack for later"
    note: "It does not matter if you dont get the foam into the tubes"
  end
end

step
  description: "Harvesting cells"
  check: "Balance the 50ml Falcon tube(s) so that they all weigh approximately (within 0.1g) the same."
  check: "Load the 50ml plastic falcon tube(s) into the large table top centerfuge such that they are balanced."
  check: "Set the speed to 3000xg" 
  check: "Set the time to 5 minutes"
  check: "MAKE SURE EVERYTHING IS BALANCED"
  check: "Hit start"
  note: "If you have never used the centerfuge before, or are unsure about any aspect of what you have just done ASK A MORE EXPERIENCED LAB MEMBER BEFORE YOU HIT START!"
end

step
  description: "Harvesting cells"
  check: "After spin take out falcon tubes and take them in a rack to the sink at the tube washing station without shaking tubes and pour out liquid from tubes in one smooth motion so as not to disturb cell pellet then recap tubes and take back to bench."
end

step
  description: "Making cells competent: Water wash"
  check: "Add 1ml of molecular grade H2O to each falcon tube and recap"
  check: "Vortex the tubes till cell pellet is resuspended"
  check: "Aliquot UPTO 1.2ml of the volume from each falcon tube into the correctly labeled 1.5ml ependorf tubes that were set aside earlier."
  note: "Devide the resuspended volume equally between the 6 ependorf tubes"
end

step
  description: "Making cells competent: Water wash"
  check: "Load the 1.5ml ependorf tubes into the table top centerfuge and spin down for 20 seconds or till cells are pelleted"
  check: "Use a pipette and remove the supernatant from each tube without disturbing the cell pellet."
  check:  "Add 1ml of molecular grade water to each ependorf tube and recap"
  check: "Vortex the tubes till cell pellet is resuspended"
end

step
  description: "Making cells competent: Resuspension"
  check: "Load the 1.5ml ependorf tubes into the table top centerfuge and spin down for 20 seconds or till cells are pelleted"
  check: "Use a pipette and remove the supernatant from each tube without disturbing the cell pellet."
end

step
  description: "Making cells competent: Resuspension"
  check: "Estimate the pellet volume using the gradations on the side of the eppendorf tube for each tube."
  check: "Add 4 pellet volumes of Frozen Competent Cell Solution (FCC) to the ependorf tube for each tube."
  check: "Vortex the tubes till cell pellet is resuspended"
  note: "The 0.1 on the tube means 100ul and each line is another 100ul"
end

counter=0
foreach x in cultures
  num = aliquots_number[counter]
  counter2=0
  xid = x[:id]
  
  while counter2<num
    step
      description: "Aliquoting cells"
      check: "Aliquot 50ul of the %{xid} resuspension into an eppendorf tube"
    end
     produce
        1 "Yeast Competent Aliquots" from x
        location: "M80"
      end
    counter2 = counter2 + 1
  end
  counter = counter + 1
end

step
  description: "Putting cells away"
  check: "Put aliquots into a styrafoam box and put into the -80C."
  note: "Make sure the styrofoam box is closed tightly so that the cells cool slowly."
end

release FCC
release water


