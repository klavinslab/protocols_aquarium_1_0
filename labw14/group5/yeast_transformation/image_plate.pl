argument
  transformed_yeast_plate_id: sample array, "Choose the plate you incubated two days ago"
end

step
  description: 
    "This protocol describes how to take a picuture of a plate and count number of colonies on the plate." 
  note: 
    "In this protocol you will use the gel station camera to take a picture
     of the plate and use software or human eye to get colony count on the plate."
end

take
  y = item transformed_yeast_plate_id
end

step
  description: "Go the the Gel room and log in there."
end

ii = 0

while ii < length(transformed_yeast_plate_id)

id_num = transformed_yeast_plate_id[ii]

step
  description: "Making a picture of a plate %{id_num}" 
end

step
  description: 
    "Put the camera hood on transilluminator"
  note: 
    "Place the agar part of a plate %{id_num} inverted on the transilluminator.
     Place the camera hood on the transilluminator. Turn on transilluminator by sliding you hand into the hood.\n"
end

step
  description: 
    "Take a picture using the camera"
  note: 
    "Turn on the camera.\n
     Set the camera at manual shooting mode by turning the dial until the 
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
     Rename the picture as the plate_id, where id should be replaced with the item number shown on your plate.\n
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
    "Turn off the transillumniator and camera, remove the camera hood, take the plate from transilluminator, wrap up
     the plate with parafilm and put it the in the Box 4 in deli fridge located at D2.100."
end

modify
  y[ii]
  location: "DFP.0"
  inuse: 0
end

ii = ii + 1

end
