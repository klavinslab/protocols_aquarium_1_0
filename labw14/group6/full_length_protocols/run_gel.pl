information "Load and run an agarose gel."


argument
  assemblies: sample array, " Select the PCR Results."
  ladder_one: sample
  fragment_volume: number, "The volume of PCR fragment to load in µL."
end


take
  glasses = 1 "Clear Protective Glasses"
end


step
  description: "Wear clear protective glasses"
end


take
  gel = 1 "50 mL 1 Percent Agarose Gel in Gel Box"
  fragment = item assemblies
  ladder = item ladder_one
  loading_dye = 1 "Gel Loading Dye Blue (6X)"
end


step
  description: "Set up the power supply."
  note: "In the gel room, obtain a power supply and set it to 100 V and with a 40 minute timer.\n\nAttach the electrodes of an appropriate gel box lid from A7.525 to the power supply."
  image: "gel_power_settings"
end


step
  description: "Set up the gel box."
  check: "Carefully remove the casting tray (with gel) and place it on the bench."
  check: "Using the graduated cylinder at A5.305, fill the gel box with 200 mL of 1X TAE from J2 at A5.500. TAE should just cover the center of the gel box."
  check: "With the gel box electrodes facing away from you, place the casting tray (with gel) back in the gel box. The top lane should be on your left, as the DNA will move to the right."
  check: "Using the graduated cylinder, add 50 mL of 1X TAE from J2 at A5.500 so that the surface of the gel is covered."
  check: "Carefully remove the comb(s) and place them in the appropriate box in A7.325."
  check: "Put the graduated cylinder back at A5.305."
  image: "gel_fill_TAE_to_line"
end


dye_volume = fragment_volume / 5.0
step
  description: "Add loading dye to the PCR fragment"
  note: "Using a 10 µL or 100 µL pipetter, add %{dye_volume} µL of loading dye to the PCR results with id %{colony}."
  image: "gel_add_loading_dye"
end


release loading_dye


step
  description: "Load the ladder"
  note: "Using a 100 µL pipetter, pipet 10 µL of ladder (containing loading dye) with id %{ladder_one} into the first (top-left) well of the gel."
  image: "gel_begin_loading"
end


step
  description: "Load the PCR"
  note: "Using a 100 µL pipetter, pipet %{fragment_volume} µL of the PCR results (containing loading dye) into the second well of the gel."
  image: "gel_begin_loading"
end


step
  description: "Wait all other groups finish loading the gel then start electrophoresis together"
  note: "Carefully attach the gel box lid to the gel box, being careful not to bump the samples out of the wells. Attach the red electrode to the red terminal of the power supply, and the black electrode to the neighboring black terminal. Hit the start button on the gel boxes - usually a small running person icon."
  warning: "Make sure the power supply is not erroring (no E* messages) and that there are bubbles emerging from the platinum wires in the bottom corners of the gel box."
  image: "gel_check_for_bubbles"
end


release ladder

release fragment  # Throw away the tube / save extra


release glasses

step
  description: "Wipe down transilluminator"
  note: "Spray with ethanol and wipe down with a kimwipe"
end

step
  description: "Take the gel (the one you just finished electrophoresis) out of gel box and put it on transilluminator"
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
     Rename the picture as the labw14_week3_gel_group_id, id should be replaced as your group id."
end
