argument
  id: sample (""), "Agar plate to be examined"
end

take
  agar_plate = item id
end

step
  description: "Go to the microscope room"
  note: "Go to the microscope room and resume the protocol from there. If already in the microscope room click next."
end

step
  description: "Setting up the microscope for use"
  note: "In the next few steps we will set up the microscope to track cells for our timelapse microscopy."
  warning: "THIS EQUIPMENT IS EXTREMELY EXPENSIVE! THE UTMOST CARE MUST BE USED WHEN HANDING THE MICROSCOPE"
  warning: "THE STEPS SHOULD BE FOLLOWED TO THE LETTER, ELSE YOU MAY BE FINED WITH HEAVY REPLACEMENT COSTS"
end

step
  description: "Turn on the fluorescent light bulb"
  note: "This must be turned on first for it draws an extremely high current."
  warning: "FAILURE TO DO THIS FIRST MAY RESULT IN A BROKEN SYSTEM."
end

step
  description: "Turn on the stage controller"
  note: "This must be turned on second"
end

step
  description: "Turn on the microscope bright-light"
  note: "This should be turned on third"
end

step
  description: "Center the stage controller"
  bullet: "Flip the switch up and down twice, and end it aligned in the center to reset the controller fully"
end

step
  description: "Turn on the X-Y controller"
  note: "This helps us pan through the surface to find cells at a fixed focal point z"

step
  descrition: "Turn on the fine Z tunning controller"
  note: "This adjusts our focal points when searching for cells"
end
