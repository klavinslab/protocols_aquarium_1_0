argument
  id: sample("Transformed E coli Strain"), "Agar plate to be disposed"
end

plate = id

step
  description: "Go to the microscope room {%plate}"
  note: "Open the protocol in the microscope room and click next"
end

step
  description: "Take out agar plate"
  bullet: "Turn the big knob on the bottom right of the microscope in a clockwise direction."
  bullet: "Open the micrscope incubator and loosen the screws."
  bullet: "Carefully take out the agar plate along with the ring."
  bullet: "Clean the lens of the microscope using an Olympus lens cleaner and shut the incubator"
  bullet: "Take the ring out and discard the agar plate" 
end

step
  description: "Dismantle the ring"
  bullet: "Take apart the dish from the ring"
  bullet: "Return ring to microscope base"
end

step
  description: "Turn off micrscope"
  bullet: "Turn off everything labeled 7 - 2 in that order"
  bullet: "Turn off the incubator labeled 0"
  bullet: "Turn off the fluorescent light bulb (labeled 1)"
end

step
  description: "Save your movie"
  bullet: "On the image screen click on the blue bar near the bottom labeled M"
  bullet: "These are your individual snap shots of each different cell"
  bullet: "On the top bar labled T move your mouse to the right and press the play button to cycle through the time images"
  bullet: "Find a cell divided properly and one that shows oscillations"
  bullet: "Go to File -> Save As, and then save your movie as 'Repressilator_your-name_date' in D:/LABW14"
  warning: "Make sure to not click anywhere else on the screen while the computer is saving the file."
  warning: "Make sure the cell you want saved is selected on the M bar"
end

release plate[0]

