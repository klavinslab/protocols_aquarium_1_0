#information "E.coli Transformation protocol"

argument
  plasmid_id: sample, "The plasmid to be used"
  e_coli_strain_id: sample, "The electrocompetent cell type to be used."
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  plasmid = item plasmid_id
end

step
  description: 
    "Intialize the Electroporator"
  note: 
    "Turn on the electroporator if it is off and set the voltage to 1250V by clicking up and down button.\n
     Click the time constant button. The LCD screen should show 0.0."
end

step
  description: "Label a 1.5 mL tube"
  note: "Write 'T' on top of the tube.\n
         Place the tube in the tube rack.\n
         This tube will eventually hold the transformed cells."
  image: "label_1_5mL_tube"
end

step
  description: "Handling Electrocompetent Cells and Electrocuvette"
  note: "You will next retrieve a styrofoam ice block, an aluminum tube rack, 
         the electrocompetent cells and a cuvette.\n
         Place the tube of cells in the aluminum tube rack on top of the ice block."
  warning: "The cuvette should be touching the ice block to keep it cool."
  image: "handle_electrocompetent_cells"
end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
  cuvette = 1 "Clean Electrocuvette"
  strain = item e_coli_strain_id
end 

step
  description: "Allow the Electrocompetent Cells to thaw slightly"
  note:  "Wait until the cells have thawed to a slushy consistency that can be pipetted out."
  warning: "Do not wait too long! Transformation efficiency  
        depends on keeping electrocompetent cells ice-cold until electroporation."
  image: "thawed_electrocompotent_cells"
end

step
  description: "Pipette 2 µL plasmid into the electrocompetent cells tube"
  note: "Swirl the tip gently in the culture to mix. Put back on the aluminum rack after mixing."
  image: "pipette_plasmid_into_electrocompotent_cells"
end

step
  description: "Electroporation and Rescue Preparation"
  note: "Set your pipettors to be 42 µL and 1000 µL.\n
         Prepare 100 µL and 1000 µL pipette tips.\n 
         Loosen cap on the 50 mL LB liquid aliquot (sterile)."
end
    
step
  description: "Transfer the cells-plasmid mixture to electrocuvette."
  note: "Take lid off the electrocuvette.\n
        Pipette 42 µL of the mixture into the center of the gap of the electrocuvette."
  warning: "Hold the plastic sides of electrocuvette during pipetting."
  image: "pipette_transformation_mix_to_cuvette"
end

step
  description: "Electroporation, Rescue and Transfer"
  note: "Put the cuvette in the electroporator and press the PULSE button twice.\n
        Remove the electrocuvette from the electroporator and QUICKLY add 1 mL of LB.\n
        Pipette up and down 3 times to extract the cells from the gap in the electrocuvette. \n
        Transfer to tube T."
  warning: "If you hear a pop, please throw away the electrocuvette, 
            click ABORT and re run the protocol from beginning."
  image: "electroporation_rescue"
  getdata
    time_constant: number, "Enter the time constant shown on the electroporator."
  end
end

produce
  r = 1 "1.5 mL tube transformation" from strain[0]
  note: "Keep the tube on the bench to use in the next protocol (plating)."
  location: "Bench"
end

transformation_id = r[:id]
    
log
  return: { transformed_cells_id: r[:id] }
end

release [falcon_tube[0],plasmid[0],iceblock[0],strain[0],alrack[0],cuvette[0]]

