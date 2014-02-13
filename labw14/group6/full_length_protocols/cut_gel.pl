step
  description: "Wipe down transilluminator"
  note: "Spray with ethanol and wipe down with a kimwipe"
end

step
  description: "Take the cut gel and put it on transilluminator"
  note: "Be careful. The gel is slippery and may fall out unexpectedly.
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
  description: "Turn on the transilluminator"
  note: "The on switch for the transilluminator is located on the side."
end

step
  description: "Take razor blade from shelf above station" 
  note: "Razor blades are located in a petri dish next to the goggles. Take one out and carefully
  clean the blade using ethanol and a kimwipe"
  image: "spray_blade"
end

step
  description: "Cut out the gel slice with length 1799bp" 
  note: "It may help to turn the room lights off during this step. Use the ladder to locate where
  1799bp is. Use the razor blade to cut around the band."
  image: "cut_gel"
end

step
  description: "Trim the gel slice"
  note: "Try to remove as much excess gel as possible. Do not remove any gel that contains the band 
  as this will limit the amount of DNA that can be extracted. In essence, try to cut away everything
  that is not glowing. It is important to trim the gel as excess gel will complicate the next protocol."
end

step
  description: "Put the gel slice into a 1.5 mL tube"
  note: "Slide the gel slice onto the razor blade, open the tube and push the slice in. If the
  slice is to big, trim down excess gel. Again, do not trim gel that contains the band, only
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
     Rename the picture as the labw14_gel_group_id, id should be replaced as your group number (1-8)."
end

produce
  r = 1 "Gel Slice" of "fLAB1"
  release y
end

log
  return: {Gel_Slice_id: r[:id]}
end
