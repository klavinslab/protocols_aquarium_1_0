argument
  
  cartridge = sample, "Reagent Cartridge"

end

step

  description : "This protocol describes the prerun setup required to use MiSeq"
  
end

step 
  description: "Use Illumina Experiment Manager (on C6 Computer)"
  check: "Open the program"
  check: "choose MiSeq"
  check: "Select the type of run"

end

step
  description : "Enter Information"
  check: "Enter investigator name"
  check: "Enter project"
  check: "Enter experiment"
  check: "Enter date"
  check: "Enter indices"
  check: "Enter run length"
  note : "Add this information for each sample to make the sheet valid"
end

step

  check: "Save sample sheet in miseq folder"
end

step

  check : "Transfer sample sheet to MiSeq using flash drive"
  check : "Save it in D:>Illumina>MiSeq Control Software>SampleSheets"
  
end

take
  
  cartridge1 = item cartridge
  
end

step

  description : "Prepare Reagent Cartridge (Use Gloves)"
  check : "Take the cartridge from the freezer (Box 1)"
  check : "Place the cartridge in a RT Water Bath"
  warning : "DO NOT fill over water line"
  
end

step

  description "Wait for 60 mins"
  timer: { hours: 0, minutes: 1, seconds: 0 } #Update to 60 min for the actual run
end

step

  check : "Invert the cartridge 10 times"
  check : "Tap the cartridge on the table to reduce air bubbles"
  check : "Place the cartidge on ice or in the fridge till you are ready to load it"
end

produce

   ready_cartridge = 1 "Reagent Cartridge ready for loading"
   location: "Bench"
end

log
 return: {ready_cartridge : ready_cartridge}
end
