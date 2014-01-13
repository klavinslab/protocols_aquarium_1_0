# Temp comment out argument for testing
#argument
#  Gel_Lane_id: sample, "The gel lane you got after run the gel"
#end

step
  description: "Take the gel out of gel box and put it on transilluminator"
  note: "Carefully remove the holder as the gel is slippery and may fall out unexpectedly.
  Slide the gel off of the holder and onto the transilluminator"
end

step
  description: "Wear the UV protection glasses"
  note: "The UV protection glasses are located above the bench in the gel station. 
  Though the transilluminators we are using emit in the visible blue spectrum, these 
  goggles protect your eyes from the bright lights and allows you to see the DNA band."
end

step
  description: "Turn on the transilluminator, put on the camera hood"
	note: "The on switch for the transilluminator is located on the side."
end

step
  description: "Turn on the camera, center around the gel and take a picture"
	note: "Switch the camera to macro mode by pressing the button with a flower and
	rotating the menu wheel to the flower icon. Make sure the white balance is set
	to tungsten. Set the exposure time to 3.5 seconds. Zoom in such that the gel takes
	up the entire field of view. Press the trigger half way to focus and all the way to take
	the photo."
end

step
  description: "Remove the camera hood, cut out the gel slice with length 1799bp"
	note: "It may help to turn the lights off during this step. Use the ladder to locate where
	1799bp is. Use the razor blade to cut around the band. Try to remove as much excess gel
	as possible. Do not remove any gel that contains the band as this will limit the amount
	of DNA that can be extracted."
end

step
  description: "Put the gel slice into a 1.5 mL tube"
	note: "Slide the gel slice onto the razor blade, open the tube and push the slice in. If the
	slice is to big, trim down excess gel. Again, do not trim gel that contains the band, only
	excess gel around the band."
end

step
  description: "Clean up the transilluminator and gel station"
	note: "Turn off the transilluminator. Dispose of the gel by placing it in the waste container. 
	Spray the surface of the transilluminator with ethanol and wipe until dry with kimwipes or paper towel."
end

produce
  r = "Gel Slice" of "fLAB2"
  location = "Bench"
end

log
  return: {Gel_Slice_id: r[:id]}
end
