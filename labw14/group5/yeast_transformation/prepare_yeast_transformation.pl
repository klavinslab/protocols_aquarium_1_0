argument
  yeast_aliquot_id: sample array, "Diluted yeast culture"
  numbers_set_id: number array, "Number of aliquot tubes of each yeast strain that were made."
  fragment_id: sample, "Digested plasmid"
end

numbers_set = numbers_set_id

num = length(yeast_aliquot_id)

step
 description: "This protocol describes how to prepare yeast trasformation mix"
end

take
  yeast_aliquot_tubes = item yeast_aliquot_id
  digested_plasmid    = item fragment_id
end

take
  peg         = 1 "50 percent PEG 3350"
  liac        = 1 "1.0 M LiOAc"
  carrier_dna = 1 "Salmon Sperm DNA (boiled)"
end

ii = 0
r = []

number_we_can_make = 1 + 1 # should be more complicated construction

while ii < number_we_can_make

  id_num = yeast_aliquot_id[ii]
  
  if ii == 0 # CONTROL TUBE
    step
      description: "Making CONTROL yeast transformation mixture"
      note: "Take a 1.5 mL tube with id %{id_num}"
      warning: "Pipette the following reagents into the tube %{id_num}.
                The order of the reagents is super important for cells' health.
                Also be as clean as possible when pipetting 50%% PEG 3350. It gets easily contaminated."
      check: "Pipette 240 μL  50%% PEG 3350 reagent to the tube."
      check: "Pipette 36 μL  1.0M LiOAc reagent to the tube."
      check: "Pipette 25 μL  Carrier DNA to the tube."
      check: "Pipette 50 μL  Molecular grade water to the tube."
      #image: "yeast_transformation_mixture_group5"
    end
    step
      description: "Resuspend the cells by vortexing"
      warning: "Vortex strongly (setting 8 or 9 on the vortexer) for 1 min or until mixed."
    end
    produce
        y = 1 "Yeast Transformation Mixture" from yeast_aliquot_tubes[ii]
        release yeast_aliquot_tubes[ii]
    end
    r = append(r,y[:id])
  else
  # NON-CONTROL TUBES
    step
      description: "Making DNA - yeast transformation mixture"
      note: "Take a 1.5 mL tube with id %{id_num}"
      warning: "Pipette the following reagents into the tube %{id_num}.
                The order of the reagents is super important for cells' health.
                Also be as clean as possible when pipetting 50%% PEG 3350. It gets easily contaminated."
      check: "Pipette 240 μL  50%% PEG 3350 reagent to the tube."
      check: "Pipette 36 μL  1.0M LiOAc reagent to the tube."
      check: "Pipette 25 μL  Carrier DNA to the tube."
      check: "Pipette 50 μL  Transformation DNA plasmid to the tube."
      #image: "yeast_transformation_mixture_group5"

    end
    step
      description: "Resuspend the cells by vortexing"
      warning: "Vortex strongly (setting 8 or 9 on the vortexer) for 1 min or until mixed."
      #image: "voltexing_strongly_group5"
    end
    produce
        z = 1 "Yeast Transformation Mixture" from yeast_aliquot_tubes[ii]
        release yeast_aliquot_tubes[ii]
    end
    r = append(r,z[:id])
  end
  
  #r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_plasmid_mixture: r }
end

release digested_plasmid
release [ peg[0], liac[0], carrier_dna[0] ]
