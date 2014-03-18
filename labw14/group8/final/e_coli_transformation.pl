#information "E.coli Transformation protocol"

argument
  plasmid: sample, "The plasmid to be used"
  e_coli_strain_type: string, "The electrocompetent aliquot to be transformed"
  plate_type: object, "The plate on which the transformed cells to be plated"
end

temp_label = plasmid[:data][:temp_label]

step
  description:"Retrieve Cuvette and Electrocompetent Cells"
  note: "You will next retrieve a Clean Electrocuvette, put it inside the styrofoam touching ice block.\n
        Then grab a tube of electrocompetent cells and put it on the aluminum tube rack. \n
        You can take 2-3 electrocuvettes at a time as long as keep them cold."
  image: "handle_electrocompetent_cells"
  warning: "The cuvette metal sides should be touching the ice block to keep it cool."
end

take
  strain = 1 e_coli_strain_type
  cuvette = 1 "Clean Electrocuvette"
end

step
  description: "Allow the Electrocompetent Cells to thaw slightly"
  note:  "Wait about 15-30 seconds till the cells have thawed to a slushy consistency."
  warning: "Transformation efficiency depends on keeping electrocompetent cells ice-cold until electroporation."
  image: "thawed_electrocompotent_cells"
end

plasmid_id = plasmid[:id]
step
  description: "Pipette 2 µL of the gibson (sample id: %{plasmid_id}) into the electrocompetent cells tube"
  check: "Pieptte into the culture, not on the side of the tube."
  check: "Swirl the tip gently in the culture to mix after pieptting."
  check: "Put back on the aluminum rack after mixing."
#  warning: "Vortex the plasmid stock before pipetting into the electrocompetent cells"
  image: "pipette_plasmid_into_electrocompotent_cells"
end

step
  description: "Electroporation and Rescue Preparation"
  check: "Set your pipettors to be 42 µL and 1000 µL."
  check: "Prepare 100 µL and 1000 µL pipette tips."
  check: "Loosen cap on the 50 mL LB liquid aliquot (sterile)."
  check: "Take the black plastic cuvette holder out of electroporator."
  warning: "When you prepare the pieptte tips, do not let the tip touch anything (such as the bench)."
  warning: "The next steps, until after you pipette up and down LB into the electrocuvette, should be done as quickly as possible."
end
    
step
  description: "Transfer the cells-plasmid mixture to electrocuvette."
  note: "Take lid off the cuvette.\n
        Pipette 42 µL of the mixture from the electrocompetent cells tube into the center of the gap of the electrocuvette."
  warning: "Hold the plastic sides of cuvette during pipetting."
  image: "pipette_transformation_mix_to_cuvette"
end

step
  description: "Electroporation, Rescue and Transfer"
  bullet: "Put the cuvette in the cuvette holder, slide into electroporator and press the PULSE button twice quickly."
  bullet: "Remove the cuvette from the electroporator after it shows the time constant."
  bullet: "QUICKLY add 1 mL of LB."
  bullet: "Pipette up and down 3 times to extract the cells from the gap in the cuvette."
  bullet: "Transfer to tube T."
  warning: "If you hear a pop, throw away the cuvette, 
            and enter -1 in the time consant box"
  image: "electroporation_rescue"
  getdata
    time_constant: number, "Enter the time constant shown on the electroporator. Remove after the electroporator shows the time constant"
  end
end

if time_constant == -1
  #handle error by recalling the above inside of a function TODO
end

plasmid_name = info(plasmid)
plasmid_name = plasmid_name[:name]

produce
  r = 1 "Transformed E coli 1.5 mL tube" of plasmid_name
  note: "Keep the tube on the bench to use in the next protocol. (no need to edit the location below)"
  location: "Bench"
end

transformed_cells = r

log
  return: { transformed_cells_id: r[:id]}
end

release [strain[0],cuvette[0]]
