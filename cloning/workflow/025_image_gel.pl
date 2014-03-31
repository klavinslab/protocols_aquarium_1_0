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
  description: "Rename the picture in Dropbox"
  note: "In gel room touch screen computer, open Dropbox/GelImages, under today's date folder and find the picture you just took.\nIf the image is not in the Dropbox, you can manually retrieve the images using a USB cord."
  getdata
    gel_name: string, "Enter the filename of the gel image"
  end
end

log
  return: {filename: gel_name}
end
