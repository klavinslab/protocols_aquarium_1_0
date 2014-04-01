argument
  plasmid_ids: sample array, "The plasmids to be used"
  e_coli_strain_type: object, "The electrocompetent E. coli aliquot type."
  plate_type: object, "The (probably LB) plate type."
end

n = length(plasmid_ids)
grow_out = 1
if plate_type == "LB Amp Plate (sterile)"
  grow_out = 0
end

# TODO: need to unique-ify the take, but also need to produce 'from' - need a key-value pair or new length-n array of taken items.
take
  plasmids = item plasmid_ids
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  electroporator = 1 "Electroporator"
end

step
  description: "Intialize the Electroporator"
  note: "Turn on the electroporator if it is off and set the voltage to 1250V by clicking up and down button.\nClick the time constant button."
end

step
  description: "Arrange Ice Block"
  note: "You will next retrieve a styrofoam ice block and an aluminum tube rack.\nPut the aluminum tube rack on top of the ice block."
  image: "arrange_cold_block"
end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
end

step
  description:"Retrieve Cuvette and Electrocompetent Cells"
  note: "You will next retrieve a Clean Electrocuvette, put it inside the styrofoam touching ice block.\nThen grab a tube of electrocompetent cells and put it on the aluminum tube rack."
  image: "handle_electrocompetent_cells"
  warning: "The cuvette metal sides should be touching the ice block to keep it cool."
end

take
  strain = n e_coli_strain_type
  cuvette = n "Clean Electrocuvette"
end

step
  description: "Allow the Electrocompetent Cells to thaw slightly"
  note:  "Wait about 15-30 seconds till the cells have thawed to a slushy consistency."
  warning: "Transformation efficiency depends on keeping electrocompetent cells ice-cold until electroporation."
  image: "thawed_electrocompotent_cells"
end

step
  description: "Label %{n} 1.5 mL tubes"
  note: "Write 'T' on the side of each tube followed by the plasmid ID and place on a tube rack. The plasmid IDs are: %{plasmid_ids}."
  image: "label_1_5mL_tube"
end

step
  description: "Prepare pipetters"
  bullet: "Set your 3 pipettors to be 2 µL, 42 µL, and 1000 µL."
  bullet: "Prepare 10 µL, 100 µL, and 1000 µL pipette tips."
end

ii = 0
while ii < n
  plasmid_id = plasmid_ids[ii]
  plasmid = plasmids[ii]

  step
    description: "Pipette 2 µL Plasmid Stock (sample id: %{plasmid_id}) into the electrocompetent cells tube"
    bullet: "Pipette into the culture, not on the side of the tube."
    bullet: "Swirl the tip gently in the culture to mix after pieptting."
    bullet: "Put back on the aluminum rack after mixing."
    image: "pipette_plasmid_into_electrocompotent_cells"
  end

  step
    description: "Electroporation and Rescue Preparation"
    bullet: "Loosen cap on the 50 mL LB liquid aliquot (sterile)."
    bullet: "Take the black plastic cuvette holder out of electroporator."
  end

  step
    description: "Transfer the cells-plasmid mixture to electrocuvette."
    note: "Take lid off the cuvette.\nPipette 42 µL of the mixture from the electrocompetent cells tube into the center of the gap of the electrocuvette."
    warning: "Hold the plastic sides of cuvette during pipetting."
    image: "pipette_transformation_mix_to_cuvette"
  end

  step
    description: "Electroporation, Rescue and Transfer"
    bullet: "Put the cuvette in the cuvette holder, slide into electroporator and press the PULSE button twice quickly."
    bullet: "Remove the cuvette from the electroporator and QUICKLY add 1 mL of LB."
    bullet: "Pipette up and down 3 times to extract the cells from the gap in the cuvette."
    bullet: "Transfer to tube T."
    warning: "If you hear a pop, throw away the cuvette, click ABORT."
    image: "electroporation_rescue"
    getdata
      time_constant: number, "Enter the time constant shown on the electroporator."
    end
  end

  produce
    r = 1 "Transformed E coli 1.5 mL tube" from plasmid
    note: "Keep the tube on the bench to use in the next protocol. (no need to edit the location below)"
    location: "Bench"
  end

  ii = ii + 1
end

release plasmids
release [electroporator[0], falcon_tube[0], alrack[0], iceblock[0]]
release strain
release cuvette
