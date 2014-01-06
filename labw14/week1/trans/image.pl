argument
  e_coli_strain_id: sample, "Choose the plate you incubated yesterday"
end

step
  description: 
    "This protocol describes how to take a picuture of a plate." 
  note: 
    "In this protocol you will use the gel station camera to take a picture
     of the plate."
end
	
take
  y = item e_coli_strain_id
end

step
  description: 
    "Image the plate without the lid"
  note: 
    "Place the agar part of the plate inverted on the transilluminator.
     Turn the on camera and transilluminator. Take a picture by centering 
     around the plate.\n
     You need to set the camera at manual shooting mode by turning the dial until the 
     M apppears, zoom in to center around the plate until the whole plate takes up the
     screen. Then click the flower button and choose macro. Set the shutter speed at 2 seconds,
     click the button with box on it, move the focus box to the edge of the plate and take
     the picture by holding the button half way down until you hear two beeps, then press
     it all the way down to take the picture."
end

step
  description: 
    "Rename the picture in Dropbox"
  note: 
    "Wait several seconds for the picture uploading to Dropbox. In gel room touch screen computer, open Dropbox/GelImages,
     under today's date folder and find the picture you just took.\n
     Rename the picture as the item number shown on your plate."
end

step
  description: 
    "Store the plate in 4C fridge."
  note:
    "Turn off the transillumniator and camera, take the plate from transilluminator, wrap up
     the plate with parafilm and put it the in the fridge located at D2.100."
end
	
modify
  y[0]
  location: "D2.100"
  inuse: 0
end


	
	
