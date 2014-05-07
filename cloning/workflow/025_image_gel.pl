argument
  gel: sample array, "Gel lanes (after gel has been run)."
end

step
  description: "Only grab one gel as part of the following takes"
  note: "You will be asked to take a set of gel slices. They should be in a single gel."
end

take
  y = item gel
end

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
  description: "Wear the blue light protection glasses"
  note: "The blue light protection glasses are located above the bench in the gel station.
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
  description: "Set up the camera software"
  note: "Check off any of the steps below if they've already been done."
  check: "Open up the EOS REBEL T3 program."
  check: "Click 'Live View Shoot' to open up the 'Remote Live View window'."
  bullet: "The camera should have these settings:\n2\ second exposure\nF4.5\n100 ISO\nS1"
  image: "gel_image_eos_rebel_t3_and_remote_live_view"
end

step
  description: "Take a picture of the gel."
  check: "Adjust the gel so that it takes up the entire field of view. Zoom in or out if necessary."
  check: "Click the trigger button on the EOS REBEL T3 window."
  check: "Identify the name of the file by looking at the Quick Preview window - it should be something similar to IMG_0002_1.JPG"
  image: "gel_image_take_picture"
  getdata
    gel_name: string, "Enter the filename of the gel image"
  end
end

log
  return: {filename: gel_name}
end
