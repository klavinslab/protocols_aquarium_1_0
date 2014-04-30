##third part of microtiter plate assay

information "third part of the microtiter biofilm plate assay"

take
  solvent = 1 "bottle of 80% ethanol 20% acetone"
  CV = 1 "small bottler of .1% cv in water"
  media = 1 "bottle of M9" 
  tray = 4 "empty large pipette tip boxes"
  plate = 1 "96 well plate previous day"
end

step
  description: "set up 4 trays. 1 for waste, remaining 3 add a few inches of tap water"
end
  
step
    description: "shake trays over waste tray, to remove media and any bacteria that didn't stick"
    
end

step 
  description: "submerge the 96 well tray in the first tray containing water. shake to wash cells."
  note: "replace water once it becomes cloudy (if running multiple assays)"
  
end

step
  description: "add 125 ul of .1% crystal violet to each well. incubate at room temperature for 10 minutes"
  note: "this is allowing the crystal violet to stain the bacteria and biofilm that has stuck"
end

step
  descripion: "shake tray(s) over the waste tray"
end

step
  description: "wash tray twice in the remaining two trays"
  bullet: "shake the tray vigorously over the waste tray between each wash"
end

step
  description: "invert each dish and tap on paper towels to remove any remaining water. Allow plates to air dry"
end

##should this be another step of the protocol? since there is a wait time but I'm not quite sure how long the wait time
##is...a few hours maybe?

step
  description: "add 200 ul of the solvent into each well. cover tray and incubate for 15 minutes"
  note: "allows dye to solubize"
end

step
  description: "pipette up and down to mix contents of each well. move 125 ul to a clean optically clear bottom 96 well plate"
end

step
  description: "use plate reader at 500-600 nm range to measure OD"
  note: "check protocol for plate reader if user is not familiar with using platereader"
  
end

##500-600 nm range seems pretty big. is there one ideal that it should be set to? or more tips? I'm guessing it has to do with the peak

