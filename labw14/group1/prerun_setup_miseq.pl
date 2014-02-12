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
