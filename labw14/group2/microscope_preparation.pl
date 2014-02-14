argument
  id: sample ("Transformed E coli Strain"), "Agar cell plate"
end

take
  plate: item id
end

step
  description: "Go to the microscope room"
  note: "Go to the microscope room and resume the protocol from there. If already in the microscope room click next."
end

step
  description: "Ensure incubation chamber is at 37 degrees"
  note: "If the incubation chamber is not at 37 degrees abort protocol and wait till chamber reaches proper temperature."
end
step  
  description: "Setting up the microscope for use"
  note: "In the next few steps we will set up the microscope to track cells for our timelapse microscopy."
  warning: "THIS EQUIPMENT IS EXTREMELY EXPENSIVE! THE UTMOST CARE MUST BE USED WHEN HANDING THE MICROSCOPE"
  warning: "THE STEPS SHOULD BE FOLLOWED TO THE LETTER, ELSE YOU MAY BE FINED WITH HEAVY REPLACEMENT COSTS"
end

step
  description: "Turn on the fluorescent light bulb"
  note: "Thsi is labeled with a 1 on it must be turned on first for it draws an extremely high current."
  warning: "FAILURE TO DO THIS FIRST MAY RESULT IN A BROKEN SYSTEM."
end

step
  description: "Turn on the shutter controller"
  note: "This is labeled with a 2 must be turned on second"
end

step
  description: "Center the shutter controller"
  bullet: "Flip the tuner switch up and down twice, and end it aligned in the center to reset the controller fully"
end

step
  description: "Turn on the microscope bright-light"
  note: "This is labeled 3 and turned on third"
end

step
  description: "Turn on the microscope"
  note: "This should be labeled number 4. The switch is a little difficult to find so you may need to feel around for it."
end

step
  description: "Turn on the X-Y controller"
  note: "This is labeld 5 and helps us pan through the surface to find cells at a fixed focal point z"

step
  descrition: "Turn on the fine Z tunning controller"
  note: "This is labeled 6 and adjusts our focal points when searching for cells"
end

step
  description: "Microscope setup complete"
  note: "Click next to procede to the next protocol"
end

log
  return: {plate: id[:id]}
end
