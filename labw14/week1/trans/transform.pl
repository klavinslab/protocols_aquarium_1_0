#information "E.coli Transformation protocol"

argument
  plasmid_id: sample, "The plasmid to be used"
  e_coli_strain_type: object, "The electrocompetent aliquot to be transformed"
  plate_type: object, "The plate on which the transformed cells to be plated"
end

if plate_type == "LB Amp Plate (sterile)"
  tube_incubation_choice = 0
else
  tube_incubation_choice = 1
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  plasmid = item plasmid_id
  electroporator = 1 "Electroporator"
end

step
  description: 
    "Intialize the Electroporator"
  note: 
    "Turn on the electroporator if it is off and set the voltage to 1250V by clicking up and down button.\n
     Click the time constant button."
end

step
  description: "Label a 1.5 mL tube"
  note: "Write 'T' on top of the tube.\n
         Place the tube in the tube rack.\n
         This tube will eventually hold the transformed cells."
  image: "label_1_5mL_tube"
end

step
  description: "Arange Ice Block and Electrocuvette"
  note: "You will next retrieve a styrofoam ice block, an aluminum tube rack, 
         and a cuvette.\n
         Put the aluminum tube rack on top of the ice block."
  warning: "The cuvette should be touching the ice block to keep it cool."

end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
  cuvette = 1 "Clean Electrocuvette"
end 

step
  description:"Retrieve Electrocompetent Cells"
  note: "You will next retrieve a tube of electrocompetent cells and put it on the aluminum tube rack."
  image: "handle_electrocompetent_cells"
end

take
  strain = 1 e_coli_strain_type
end

step
  description: "Allow the Electrocompetent Cells to thaw slightly"
  note:  "Wait until the cells have thawed to a slushy consistency that can be pipetted out."
  warning: "Around 10-15 seconds is enough!. Transformation efficiency  
        depends on keeping electrocompetent cells ice-cold until electroporation."
  image: "thawed_electrocompotent_cells"
end

step
  description: "Pipette 2 µL plasmid into the electrocompetent cells tube"
  note: "Swirl the tip gently in the culture to mix. Put back on the aluminum rack after mixing."
  warning: "Vortex the plasmid stock before pipetting into the electrocompetent cells"
  image: "pipette_plasmid_into_electrocompotent_cells"
end

step
  description: "Electroporation and Rescue Preparation"
  bullet: "Set your pipettors to be 42 µL and 1000 µL."
  bullet: "Prepare 100 µL and 1000 µL pipette tips."
  bullet: "Loosen cap on the 50 mL LB liquid aliquot (sterile)."
  bullet: "Take the black plastic cuvette holder out of electroporator."
end
    
step
  description: "Transfer the cells-plasmid mixture to electrocuvette."
  note: "Take lid off the cuvette.\n
        Pipette 42 µL of the mixture into the center of the gap of the electrocuvette."
  warning: "Hold the plastic sides of cuvette during pipetting."
  image: "pipette_transformation_mix_to_cuvette"
end

step
  description: "Electroporation, Rescue and Transfer"
  bullet: "Put the cuvette in the cuvette holder, slide into electroporator and press the PULSE button twice."
  bullet: "Remove the cuvette from the electroporator and QUICKLY add 1 mL of LB."
  bullet: "Pipette up and down 3 times to extract the cells from the gap in the cuvette."
  bullet: "Transfer to tube T."
  warning: "If you hear a pop, throw away the cuvette, 
            click ABORT."
  image: "electroporation_rescue"
  getdata
    time_constant: number, "Enter the time constant shown on the electroporator."
  end
end

produce
  r = 1 "Transformed E coli 1.5 mL tube" of "pLAB1 in Z1"
  note: "Keep the tube on the bench to use in the next protocol."
  location: "Bench"
end

transformation_id = r[:id]
    
log
  return: { transformed_cells_id: r[:id], tube_incubation_choice : tube_incubation_choice }
end

release [electroporator[0],falcon_tube[0],plasmid[0],alrack[0],iceblock[0],strain[0],cuvette[0]]

