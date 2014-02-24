# Modified from existing protocol
information "Spread cells onto a petri dish containing ~25mL agar media."

argument
   e_coli_strain_id: sample array, "A sample"
   volume: number, "The volume (µL) to plate"
   plate_type: object, "Type of plates you will use to select for transformed cells.\nList in order of corresponding transformed E. coli strains (from the solidmedia category)"
#   plate_type_2: object, "Type of inducer plate (from the solidmedia category)"
end

sample_count = length(e_coli_strain_id)
take
  strain = item e_coli_strain_id
  plate = sample_count plate_type
#  plate_2 = 1 plate_type_2
#  beads = 1 "Glass Bead Aliquot (sterile)"
#  collector = 1 "Glass Bead Waste Collector"
  note: "Do not take plate from top of the stack if there is a date stick on it, take from the middle of the stack."
end

step
  	description: "Write down your initials and date on plates and label 1-%{sample_count}"
  	image: "write_on_the_plate"
end
	
transformed_plates = []

i = 0
while i < sample_count
	current_sample = i + 1
	plate_sample_id = plate_type[i]
	coli_sample_id = e_coli_strain_id[i]
	
	
	step
	  description: "Add sterile glass beads to plate %{current_sample}"
	  note: "Invert the plate so that the lid is on the bench. 
			 Add 5-10 beads to the inside of the lid (lift the plate up). 
			 Place the plate back on the lid afterwards."
	  image: "pour_beads_on_plate"
	end

	step
	  description: "Vortex sample %{coli_sample_id}"
	  note: "Vortex sample %{coli_sample_id} on vortexor."
	  image: "vortex_tube"
	end

	step
	  description: "Transfer sample %{coli_sample_id} to the center of the plate"
	  note: "Invert plate %{current_sample} so the beads are on the agar surface. Lift the lid and 
			 pipette %{volume} µL of sample on the agar surface
			 and put the lid back on the plate."
	  warning: "Do not place the plate lid on lab bench while you do this."
	  image: "pipette_culture_on_plate"
	end

	step
	  description: "Shake the plate to spread the sample over the surface."
	  note: "Use 4 sharp shakes, turn 90 degrees between two shakes (keep the plate level while turning), then pour the beads out into the waste bead container. 
			 When done, place the plate lid down on the bench in preparation for incubation."
	  image: "spread_beads_on_plate"
	end

	produce
	  r1 = 1 "Agar plate" from strain[i]
	  note: "Plate upside down in 30 C incubator at A1.110."
	  location: "A1.110"
	  data
	  	from: strain[i][:id]
	  	original_id: strain[i][:original_id]
	  end
	  release [plate[i]]
	end
	transformed_plates = append(transformed_plates, r1[:id])
	
	id = id + 1
end
#produce
 # r2 = 1 "Transformed E coli plate" of "pLAB1 in Z1"
  #note: "Keep the plate on the bench to use in the next protocol (incubating)."
  #location: "Bench"
  #release plate_2
#end

log
  return: { plate_id: transformed_plates}
end
  
release strain
