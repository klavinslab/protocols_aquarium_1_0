#information "E.coli Transformation protocol"

argument
  plasmid_id: sample, "The plasmid to be used"
  e_coli_strain_id: object, "The electrocompetent cell type to be used."
  plate_type: object, "The plate on which the transformed cells to be plated"
end

tube_incubation_choice = 1
if plate_type == "LB Amp Plate (sterile)"
  tube_incubation_choice = 0
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  plasmid = item plasmid_id
  timer = 1 "Timer"
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
  note: "Write 'T.E' on top of the tube, along with your initials and the date.\n
         Place the tube in the tube rack.\n
         This tube will eventually hold the transformed cells."
  image: "label_1_5mL_tube"
end

step
  description: "Set up timer."
  note: "This protocol requires that we time certain actions. You will use a physical timer to record your 
        electrocompetent cell thaw time and your transformation rescue time"
  bullet: "Press clear to clear all rows to 00:00"
  bullet: "When asked to start the timer, you'll press the number 3."
  bullet: "To stop the timer, press 3 again."
  image: "timer"
end

step
  description: "Handling Electrocompetent Cells and Electrocuvette"
  note: "You will next retrieve a styrofoam ice block, an aluminum tube rack, 
         the electrocompetent cells and a cuvette."
  bullet: "Take the timer with you. You will start the timer when you remove the 
          electrocompetent cells from the freezer to record thaw time."
  bullet: "Place the tube of cells in the aluminum tube rack on top of the ice block."
  warning: "The cuvette should be touching the ice block to keep it cool."
  image: "handle_electrocompetent_cells"
  image: "start_timer"
end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
  cuvette = 1 "Clean Electrocuvette"
  strain = 1 e_coli_strain_id
  note: "Start the timer when you remove the e.comp cells from the freezer to begin recording thaw time."
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
  bullet: "Vortex the plasmid stock before pipetting into the electrocompetent cells"
  bullet: "Stop the timer when you are ready to pipette"
  bullet: "Swirl the tip gently in the culture to mix. Put back on the aluminum rack after mixing."
  getdata
    thaw_time_min: number, "Enter the number of MINUTES shown on the timer. (i.e. recorded thaw time)"
    thaw_time_sec: number, "Enter the number of SECONDS shown on the timer."
  end
  image: "pipette_plasmid_into_electrocompotent_cells"
end

step
  description: "Electroporation and Rescue Preparation"
  bullet: "Set your pipettors to be 42 µL and 1000 µL."
  bullet: "Prepare 100 µL and 1000 µL pipette tips."
  bullet: "Loosen cap on the 50 mL LB liquid aliquot (sterile)."
  bullet: "Take the black plastic cuvette holder out of electroporator."
  bullet: "Clear the timer. You will be using the timer now to record rescue time."
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
  bullet: "Put the cuvette in the cuvette holder, slide into electroporator and press the PULSE button twice while
        starting the timer."
  bullet: "Remove the cuvette from the electroporator and QUICKLY add 1 mL of LB."
  bullet: "Pipette up and down 3 times to extract the cells from the gap in the cuvette, and then stop the timer."
  bullet: "Transfer to the T.E. tube with your initials on it"
  warning: "If you hear a pop, throw away the cuvette, 
            click ABORT."
  image: "electroporation_rescue"
  image: "start_timer"
  getdata
    time_constant: number, "Enter the TIME CONSTANT shown on the electroporator."
    rescue_time: number, "Enter the number of SECONDS it took for you to RESCUE. (i.e. the timer's recorded time)"
  end
end

produce
  r = 1 "Transformed E coli 1.5 mL tube" of "pLAB1 in Z1"
  #r = 1 "Transformed E. coli Aliquot" from plasmid_id
  note: "Keep the tube on the bench to use in the next protocol."
  location: "Bench"
end

transformation_id = r[:id]
    
log
  return: { transformed_cells_id: r[:id], tube_incubation_choice : tube_incubation_choice }
end

release [timer[0],falcon_tube[0],plasmid[0],iceblock[0],strain[0],alrack[0],cuvette[0]]

step
  getdata
    thaw_time_accurate: string, "Is your THAW time accurate? Yes if accurate, No if there was an issue while timing.", ["yes","no"]
    rescue_time_accurate: string, "Is your RESCUE time accurate? Yes if accurate, No if there was an issue while timing?", ["yes","no"]
    ecomp_cell_accurate: string, "Did you use the e.comp cells in the box with the pink tape labled 'transformation
            efficiency only'?", ["yes","no"]
  end
end
