argument
  
  comb_sample : sample, "The combined (Denatured and Diluted PhiX Control +  Denatured and Diluted sample library) sample library"

end

step
  
  description : "This protocol describes the process to load te sample library to MiSeq and run sequencing process"
  
end

take 

  comb_sample_1 = item comb_sample
  
end

step 
  
  description : "Load the library"
  check : "Using a 1 mL pippet tube pierce the foil of the reservoir labled Load Sample"
  warning : "Do not pierce the foil of any other reservoirs. They will be pierced automatically durin run"
  check : "Load 600 uL of the combined sample libraries to the Load Reservoir"
  warning : "Do not touch the foil seal while loading the sample"
  
end

take

  milliq1 = 1 "MilliQ_Water"
  ethanol_1 = 1 "ethanol_70"
  flowcell_1 = 1 "Flowcell"
  
end

step 
  description : "Clean flowcell (use gloves)"
  check : "Remove flowcell from storge buffer using plastic forceps"
  check : "Rinse flowcell with 2 mL MilliQ Water"
  warning : "Make sure that there is no excess salt"
  check : "Dry flowcell using kimwipes"
  check : "Clean flowcell glass using kimwipes and 70%% EtOH"
  check : "Dry any remaining extra alchohol and fingerprints"

end

step 
  description : "Load flowcell (use fresh gloves)"
  check : "Clean flowcell stage in the flowcell compartment"
  check : "Place the flowcell onto flowcell stage with label facing up"
  warning : "The swinging arm supports the flowcell, be careful"
  check : "Softly press down. Listen for the click"
  check : "Close the door"
  check : "Press next on the machine screen"

end

take
  
  pr2 = 1 "PR2"
  waste = 1 "Waste Bottle"

end
step 
  description : "Load PR2 and waste bottle"
  check : "Take bottle from fridge and remove lid"
  check : "Raise the sipper handle to allow placing of the bottle"
  check : "Place the bottle in reagent compartment"
  check : "Empty waste bottle"
  check : "Lower sipper handle"
  check : "Close the door"
  check : "Follow instructions on the machine screen"
end

step
  description : "Load the cartridge"
  check : "Place the reagent cartridge in its location"
  check : "Quickly close the door"
  warning : "Do not leave the door of the reagent chiller open for long"
  check : "Select the change sample sheet button on the machine screen"
  check : "select your sample sheet"

end


step 

  description : "Start Sequencing Run"
  check : "Review Experiment Name"
  check : "Review Analysis Workflow"
  check : "Review Run Length"
  check : "Review folder location"
  warning : "Refer to the image to make sure you use your desired read length" 
  check : "Press next on the machine screen"
  check : "Wait for the MiSeq pre-run check"
  note : "The goal is to have 750-1000K clusters/mm2"
  
  image : "ReadLength_Vs_Time"

end

take 

  wash_tray = 1 "Wash Tray (gray)"
  wash_bottle = 1 "Wash bottle containing the wash buffer"

end

step

  description : "Set up Post Run Wash"
  check : "Select Start Wash"
  check : "Remove Cartridge"
  check : "Add prepared wash buffer to each reservoir of the wash tray"
  check : "Insert Wash Tray"
  check : "Raise sipper from reagent compartment"
  check : "Replace the PR2 bottle with wsh bottle containing wash buffer"
  note : "Throw away the contents of PR2 bottle into the drain"
  check : "Throw away contents of waste bottle into the MiSeq waste container (at S403 fume hood)"
  check : "Lower sipper and close the door"
  
end

step 

  description : "Start Post Run Wash"
  check : "Select next on the machine screen to start the post run wash"
  
end

step
  
  description : "After completion of the wash, leave the wash bottle, wash tray, used flowcell in the instrument till the next run"
  
end

tmp = concat(wash_bottle,wash_tray)

release concat(tmp,flowcell_1)

tmp1 = concat(pr2,waste)
tmp3 = concat(milliq1,etanol_1)

release concat(tmp2,tmp3)



