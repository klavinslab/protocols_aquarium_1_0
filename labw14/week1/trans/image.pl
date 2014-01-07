argument
  Transformed_E_coli_Strain_id: sample, "Choose the plate you incubated yesterday"
end

step
  description: 
    "This protocol describes how to take a picuture of a plate and count number of colonies on the plate." 
  note: 
    "In this protocol you will use the gel station camera to take a picture
     of the plate and use software or human eye to get colony count on the plate."
end
	
take
  y = item Transformed_E_coli_Strain_id
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
     Rename the picture as the plate_id, where id should be replaced as the item number shown on your plate.\n
     For example, a plate with id 798 should have picture name plate_798."
end

step
  description: 
    "Drag the picture into OpenCFU software and get the count."
  note: 
    "Open the OpenCFU software, drag the picture into the software and wait for the software to count the colonies."
end

step
  description: 
    "Record the count."
  note:
    "If the software recognizes the coloines correctly and give a reasonbale count, record
     that number below. If not, count the number of colonies by dividing up the plate in
     four regions, get the count in each region and sum up as the final count." 
  getdata
    count: number, "Enter the count."
  end
end

step
  description: 
    "Store the plate in 4C fridge."
  note:
    "Turn off the transillumniator and camera, take the plate from transilluminator, wrap up
     the plate with parafilm and put it the in the box 0 in deli fridge located at D2.100."
end
	
modify
  y[0]
  location: "DFP.0"
  inuse: 0
end


	
	
