
argument
  fragment_id: sample array, "List of fragments to trans form into respective ecomp strain"
  dna_vol: number, "Volume of DNA to trnsform (ul)"
  strain_list: sample array, "The e coli strains in order of mapping with knockout plasmid"
  ice: generic, "taken iceblock"
  alrack: generic, "taken alrack"
end

sample_count = length(strains)
take
  fragments = item unique(fragment_id)
  electroporator = 1 "Electroporator"
  cuvette = sample_count "Clean Electrocuvette"
  lbtube = 1 "50 mL LB liquid aliquot (sterile)"
end

step
    description: "Arange Ice Block"
    note: "You will next arrange the styrofoam ice block and the aluminum tube rack.\n
       Put the aluminum tube rack on top of the ice block."
    image: "arrange_cold_block"
end

step
    description:"Setup Electrocuvettes"
    note: "Put Electrocuvettes inside the styrofoam touching ice block."
    image: "handle_electrocompetent_cells"
    warning: "The cuvette metal sides should be touching the ice block to keep it cool."
end

step
  description:"Setup Electrocompetent Cells"
  bullet: "Place electrocompetent cells on the aluminum tube rack to cool."
  image: "handle_electrocompetent_cells"
end

  
step
  description:
    "Intialize the Electroporator"
  note: 
    "Turn on the electroporator if it is off and set the voltage to 1800V by clicking up and down button.\n
     Click the time constant button."
end

trans_cell_ids = []
trans_cell_tm_consts = []
i=0
while i<length(strain_list)
  t_tube_label = i+1
  fragment = fragment_id[i]
  compstr = strain_list[i] 
  step
    description: "Label a 1.5 mL tube."
    note: "Label a tube T%{t_tube_label}.\n
       Place the tube in the tube rack.\n
       This tube will eventually hold the transformed cells."
    image: "label_1_5mL_tube"
  end
  
  
  step
    description: "Pipette %{dna_vol} &micro;L Fragment (sample id: %{fragment}) into the 1.5 ml electrocompetent cell tube labeled f%{compstr})"
    bullet: "Swirl the tip gently in the culture to mix after pipetting."
    bullet: "Put back on the aluminum rack after mixing."
    image: "pipette_plasmid_into_electrocompotent_cells"
  end

  step
    description: "Electroporation and Rescue Preparation"
    bullet: "Set your pipettors to be 50 &micro;L and 1000 &micro;L."
    bullet: "Loosen cap on the 50 mL LB liquid aliquot (sterile)."
    bullet: "Turn the electroporator on and set the voltage to 1800 V."
    bullet: "Take the black plastic cuvette holder out of electroporator."
  end

  step
    description: "Transfer the cells-plasmid mixture to electrocuvette."
    note: "Take lid off the cuvette.  Pipette 50 &micro;L of the mixture from the electrocompetent cell tube %{t_tube_label} into the center of the gap of the electrocuvette."
    warning: "Hold the plastic sides of cuvette during pipetting."
    image: "pipette_transformation_mix_to_cuvette"
  end

  step
    description: "Electroporation, Rescue and Transfer"
    bullet: "Put the cuvette in the cuvette holder, slide into electroporator and press the PULSE button twice quickly."
    bullet: "Wait for the electroporator to finish (it should make a long beep and take roughly 10 seconds total from double press to electroporation)."
    bullet: "Remove the cuvette from the electroporator and QUICKLY add 1 mL of LB."
    bullet: "Pipette up and down 3 times to extract the cells from the gap in the cuvette."
    bullet: "Transfer to tube T%{t_tube_label}."
    image: "electroporation_rescue"
    getdata
      time_constant: number, "Enter the time constant shown on the electroporator.(you may have to press the time constant button to read it)"
    end
  end

#TODO: workout how many retries.
  if 1==1 #time_constant >= 3.0
    produce
      r = 1 "1.5 mL tube transformation" from 
      note: "Cover the label T%{t_tube_label} with one of the white circle stickers and add write the above item number on the sticker.  Either now or when you're done you may place the tube in the 30C incubator at A1.110"
      location: "I1"
      data
        fragment: fragment
        parent_id: compstr
      end
    end
    
    trans_cell_ids = append(trans_cell_ids, r[:id])
    trans_cell_tm_consts = append(trans_cell_tm_consts, time_constant)
    

  else
    step
      description: "Transformation Unsuccessful"
      note: "Your time constant value was too low, resulting in an unsuccessful transformation. You must now discard your Transformed E.coli 1.5 mL tube and repeat this protocol."
    end
    trans_cell_ids = append(trans_cell_ids, 0000)
    trans_cell_tm_consts = append(trans_cell_tm_consts, time_constant)
  end
  i = i + 1
end

log
  return: {transformed_cells_ids: trans_cell_ids, time_constants: trans_cell_tm_consts }
end

release [electroporator[0],lbtube[0]]
release [ice,alrack]
release fragments
release cuvette
