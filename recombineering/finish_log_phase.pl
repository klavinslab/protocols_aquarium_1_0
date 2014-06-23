 
argument
  log_cells: sample array, "The sample that you want to spec its concentration"
end

#currently unused
OD_min = 0.4
OD_max = 0.6

take
  y = item log_cells
  lb = 1 "50 mL LB liquid aliquot (sterile)"
end

information "Measure cell density using Nanodrop."

#TODO: update nanodrop location.
step
  description: "Take the cells and LB to the Nanodrop"
  note: "Log into Aquarium at a computer close to the Nanodrop."
end

step
  description: "Navigate to 'Cell Culture' page"
  bullet: "If you are at the 'Cell Culture' page, proceed to the next step"
  note: "\nOtherwise:"
  bullet: "press the exit button and confirm that you wish to leave"
  bullet: "Select 'cell culture' mode"
  bullet: "The software will ask you to initialize the spectrophotometer. Follow the on screen instructions."
  bullet: "Initialize with 2 &micro;l molecular grade water and make sure to pipette a clean, bubble free drop or you may have to repeat the initialization."
  image: "cell_cultures_page"
end

ODs = []


step
  description: "Blank the Nanodrop"
  bullet: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  bullet: "Carefully pipette add 2 &micro;L of LB to the lower pedestal." 
  bullet: "Close the pedestal."
  bullet: "Click Blank in the software."
end


foreach c in log_cells
  step
    description: "Measure your sample"
    bullet: "Open the pedestal"
    bullet: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
    bullet: "Carefully pipette 2 &micro;L of sample %{c} on the lower pedestal."
    bullet: "Close the pedestal."
    check: "Click Measure in the software."
  end

  step
    description: "Record the absorbance shown on the nanodrop computer"
    getdata
      absorbance: number,"Write down the absorbance shown in the '600 nm Abs.' box. (not to be confused with the 'Abs.' box under the 'User Cursor' label.)" 
    end
    image: "measurement" 
  end
  OD = 10*absorbance
  ODs = append(ODs, OD)
  
#TODO: make this check restart the protocol later.  for now just skip the check
  #if OD < OD_min
    #step
      #description: "The OD is too low; the cells haven't grown enough!"
      #note: "Reincubation is suggested. Click next."
    #end

    #step
      #description: "Re-incubate the suspension."
      #note: "let your instructor know the suspension needs more time to incubate."
    #end

#   release c
  #end

#if the OD is too high, oh well, keep going it's probably fine.
  #if OD > OD_max
    #step
      #description: "The OD is too high, cell growth has saturated!"
      #note: "Results may be negatively affected"
    #end
  #end
  
  step
    description: "Clean the Nanodrop"
    bullet: "Open the pedestal"
    bullet: "Wipe both lower (sensor) pedestal and the upper (lid) pedestal with Kimwipe."
  end
end
foreach yy in y
  modify 
    yy
    location: "Bench"
  end
end

release y
release lb

log
  return: {ODs: ODs}
end
