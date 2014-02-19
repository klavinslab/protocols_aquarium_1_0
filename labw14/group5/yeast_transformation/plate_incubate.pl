information "You will spread transformed yeast cells onto a petri dish containing ~25mL YPAD media."

argument
   yeast_strain_id: sample array, "Transformed yeast mixtures"
#   volume: number, "The volume (µL) to plate"
   plate_type: object, "Type of plate (from the solidmedia category)"
end

num = length(yeast_strain_id)

take
   strain = item yeast_strain_id
   note: "Collect tubes %{yeast_strain_id} with transformed yeast cells from the heat block, location: B3.355.
          Place them in a small tube rack."
end

step
   description: "Preparing for plating"
   check: "Spin all the tubes down for 30 seconds on a small tabletop centrifuge."
   check: "Carefully remove the supernatant from each tube with a pipettor (~400μL setting total)."
   check: "Add 600μL of molecular grade water to each tube."
   check: "Vortex the tubes for 15-30 sec."
end

take
  plate  = num plate_type
  note: "Do not take plate from top of the stack if there is a date stick on it, take from the middle of the stack."
end

step
  description: "Label the YPAD plates"
  note: "Write down your initials and date on the YPAD plates. Write 'CONTROL' on one of the plates."
  image: "write_on_the_plate"
end


ii = 0
r  = []

while ii < length(yeast_strain_id)

   num_id = yeast_strain_id[ii]

   if ii == 0
      step
        description: "Add sterile glass beads to the plate"
        check: "Take 'CONTROL' YPAD plate."
        note: "Invert the plate so that the lid is on the bench. 
               Add 5-10 beads to the inside of the lid (lift the plate up). 
               Place the plate back on the lid afterwards."
        image: "pour_beads_on_plate"
      end
   else
      step
        description: "Add sterile glass beads to the plate"
        check: "Take another sterile YPAD plate."
        note: "Invert the plate so that the lid is on the bench. 
               Add 5-10 beads to the inside of the lid (lift the plate up). 
               Place the plate back on the lid afterwards."
        image: "pour_beads_on_plate"
      end
   end

   step
     description: "Vortex the sample"
     note: "Vortex tube %{num_id} with transformed yeast cells on vortexor."
     image: "vortex_tube"
   end

   step
     description: "Transfer the sample to the center of the plate"
     note: "Invert the plate so the beads are on the agar surface. Lift the lid and 
            pipette 200 µL of the transformed yeast mixture from tube %{num_id} on the agar surface
            and put the lid back on the plate."
     warning: "Do not place the place the lid on lab bench while you do this."
     image: "pipette_culture_on_plate"
   end

   step
     description: "Shake the plate to spread the sample over the surface."
     note: "Use 4 sharp shakes, turn 90 degrees between two shakes (keep the plate level while turning), then pour the beads out into the waste bead container. 
            When done, place the plate lid down on the bench in preparation for incubation."
     image: "spread_beads_on_plate"
   end

   produce
     y = 1 "Yeast Plate" from strain[0]
     note: "Plate upside down in 30 C incubator at A1.110."
     location: "A1.110"
     release plate
   end
   
   r = append(r,y[:id])

   ii = ii + 1
end

#produce
 # r2 = 1 "Transformed E coli plate" of "pLAB1 in Z1"
  #note: "Keep the plate on the bench to use in the next protocol (incubating)."
  #location: "Bench"
  #release plate_2
#end

log
  return: { plate_id: r}
end
  
release strain

