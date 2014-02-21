argument
  fragment_gel_lane: sample, "The gel lane you got after run the gel"
end

take
  y = item fragment_gel_lane
end

step
  description: "Take the gel lane you got after running electropheresis and place it at the transilluminator bench"
  note: "Take care not to damage the gel such that it cannot be imaged"
end

#argument
  #gel: sample, "The gel lane you got after run the gel"
#end

#take
  #y = item gel
#end

step
  description: "Wipe down transilluminator"
  note: "Spray with ethanol and wipe down with a kimwipe"
end

step
  description: "Take the gel out of gel box and put it on transilluminator"
  note: "Carefully remove the holder from the gel box. The gel is slippery and may fall out unexpectedly.
  Slide the gel off of the holder and onto the surface of the transilluminator"
  image: "slide_gel"
end

step
  description: "Wear the UV protection glasses"
  note: "The UV protection glasses are located above the bench in the gel station. 
  Though the transilluminators we are using emit in the visible blue spectrum, these 
  glasses protect your eyes from the bright lights and allows you to see the DNA band.
  If you wear glasses, wear the glasses over your glasses."
  image: "wear_uv"
end

step
  description: "Turn on the transilluminator, put on the camera hood"
  note: "The on switch for the transilluminator is located on the side."
end

step
  description: "Turn on the camera"
  note: "The camera is turned on by pressing the power button once."
end

step
  description: "Adjust camera settings"
  note: "The camera settings must be properly adjusted for gel photography if they are not already."
  bullet: "Turn the large dial to manual (M)"
  bullet: "Switch the camera to macro mode by pressing the button with a flower and
  rotating the menu wheel to the flower icon."
  bullet: "Set the ISO to 100 by turning the larger dial"
  bullet: "Set the white balance to tungsten by pressing the center button and navigating to tungsten."
  bullet: "Set the shutter speed to 4 seconds by turning the menu wheel."
end

step
  description: "Take a picture of the gel."
  note: "Zoom in such that the gel takes up the entire field of view."
  note: "Press the trigger half way to focus and all the way down to take the photo. Leave the camera on
  as it takes time to transmit the photo to the computer wirelessly"
end

step
  description: "Take razor blade from shelf above station" 
  note: "Razor blades are located in a petri dish next to the goggles. Take one out and carefully
  clean the blade using ethanol and a kimwipe"
  image: "spray_blade"
end

step
  description: "Remove the camera hood, cut out the gel slices with length 1799bp" 
  note: "It may help to turn the room lights off during this step. Use the ladder to locate where
  1799bp is. Use the razor blade to cut around the band."
  image: "cut_gel"
end

step
  description: "Trim the gel slices"
  note: "Try to remove as much excess gel as possible. Do not remove any gel that contains the band 
  as this will limit the amount of DNA that can be extracted. In essence, try to cut away everything
  that is not glowing. It is important to trim the gel as excess gel will complicate the next protocol."
end

step
  description: "Put the gel slices into two 1.5 mL tubes"
  note: "Slide the gel sliced onto the razor blade, open the tubes and push the slices in. If the
  slices are too big, trim down excess gel. Again, do not trim gel that contains the band, only
  excess gel around the band."
  image: "slice_tube"
end

step
  description: "Clean up the transilluminator and gel station"
  note: "Turn off the transilluminator. Dispose of the gel and any gel fragments by placing it in the waste container. 
  Spray the surface of the transilluminator with ethanol and wipe until dry using kimwipes or paper towel. If the
  lights in the room are turned off, turn the lights back on. Remove the UV goggles and put them back where you
  found them."
end

step
  description: 
    "Rename the picture in Dropbox"
  note: 
    "In gel room touch screen computer, open Dropbox/GelImages, under today's date folder and find the picture you just took.\n
     Rename the picture as the labw14_gel_group_id."
end

produce
  r = 2 "Gel Slice" of "fLAB1"
  release y
end

log
  return: {Gel_Slice_id: r[:id]}
end

