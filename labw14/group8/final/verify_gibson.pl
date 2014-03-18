argument
  gibsons: sample array, "the gibsons to verify"
  #e_coli_strain_type: string, "The electrocompetent aliquot to be transformed"
  volume: number, "The volume (µL) to plate"
  plate_type: object, "Type of plate (from the solidmedia category)"
end

e_coli_strain_type ="DH5alpha Electrocompetent Aliquot"

# based off / reused from group 6
take
  lb = 1 "50 mL LB liquid aliquot (sterile)"
  electroporator = 1 "Electroporator"
  gibsons = item gibsons # comment this out after testing
end

step
  description: 
    "Intialize the Electroporator"
  note: 
    "Turn on the electroporator if it is off and set the voltage to 1250V by clicking up and down button.\n
     Click the time constant button."
end

step
  description: "Label 1.5 mL tube(s)"
  note: "Label one tube for each of the gibson tubes with the same letter-number.\n
         Place the tube(s) in the tube rack.\n
         These tube(s) will eventually hold the transformed cells."
  image: "label_1_5mL_tube"
end

step
  description: "Arange Ice Block"
  note: "You will next retrieve a styrofoam ice block and an aluminum tube rack.\n
         Put the aluminum tube rack on top of the ice block."
  image: "arrange_cold_block"
end

take
  iceblock = 1 "Styrofoam Ice Block"
  alrack = 1 "Aluminum Tube Rack"
end 

to_release = [lb, electroporator, iceblock, alrack]

transformed_cells_array = [ ]
plates_array = [ ]
foreach g in gibsons

  include "labw14/group8/final/e_coli_transformation.pl"
    plasmid: g
    e_coli_strain_type: e_coli_strain_type
    plate_type: plate_type
    r = transformed_cells
  end

  transformed_cells_array = append (transformed_cells_array, r)
  
  include "labw14/group8/final/plate.pl"
    plate_type: plate_type
    volume: volume
    e_coli_strain: r
    rp = r1
  end
  plates_array = append(plates_array, rp)

end

step
  description: "Store the leftover gibson results"
  note: "Put them in the locations shown on the next page"
end

release gibsons # lets hope it asks them to put in fridge, not thermocycler

step
  description: "Dispose of the leftover transformed cells"
end

release transformed_cells_array

step
  description: "That's its for today - awesome!"
  note: "Tomorrow you'll image the plates to get colony counts"
end

log
  return: {successful: plates_array, failed: [ ]} # put new resulting samples from produce here
end
