# warning this protocol written to take in an array of ids
# since have to take the plates again

argument
  plate_ids: sample array, "The plates to image" 
end

step
  description: 
    "This protocol describes how to take picture(s) of your plate(s) and count the number of colonies on the plate." 
  note: 
    "In this protocol you will use the gel station camera to take a picture
     of the plate and use software or human eye to get colony count on the plate."
end

take
  plates = item plate_ids
end

step
  description: 
    "Put the camera hood on transilluminator"
  note: 
    "Go the the Gel room, place the agar part of the plate inverted on the transilluminator.
     Place the camera hood on the transilluminator. Turn on transilluminator by sliding you hand into the hood.\n"
end

step
  description: 
    "Take a picture of each plate using the camera"
  note: 
    "Turn on the camera.\n
     Set the camera at manual shooting mode by turning the dial until the 
     M apppears, zoom in to center around the plate until the whole plate takes up the
     screen. Then click the flower button and choose macro. Set the shutter speed at 2 seconds,
     click the button with box on it, move the focus box to the edge of the plate and take
     the picture by holding the button half way down until you hear two beeps, then press
     it all the way down to take the picture."
  warning: "Keep the plates in order as you do this. It helps to go from smallest id to biggest id"
end

step
  description: 
    "Rename the picture(s) in Dropbox folder (if it is working)"
  note: 
    "Wait several seconds for the picture uploading to Dropbox. In gel room touch screen computer, open Dropbox/GelImages,
     under today's date folder and find the picture you just took.\n
     Rename the picture as the plate_id, where id should be replaced with the item number shown on your plate.\n
     For example, a plate with id 798 should have picture name plate_798."
  warning: "Dropbox hasn't been working recently. If your image doesn't show up in the folder within 5 minutes,
            transfer the files manually by taking the camera off the mount, taking the orange memory card,
            and putting it into the orange usb memory card reader (usually near the keyboard), and plug it in."
end

step
  description: 
    "Drag the picture into OpenCFU software and get the count."
  note: 
    "Open the OpenCFU software, drag the picture into the software and wait for the software to count the colonies."
end

foreach p in plates

  id = p[:id]
  step
    description: 
      "Record the count for plate %{id}."
    note:
      "If the software recognizes the coloines correctly and give a reasonbale count, record
       that number below. If not, count the number of colonies by dividing up the plate in
       four regions, get the count in each region and sum up as the final count." 
    getdata
      count: number, "Enter the count."
    end
  end

  p[:data][:colony_count] = count

end

step
  description: 
    "Store the plates in the 4C fridge."
  note:
    "Turn off the transillumniator and camera, remove the camera hood, take the plate from transilluminator, wrap up
     the plate with parafilm and put it the in the Box 6 in deli fridge located at D2.100."
end

#can i add data here
# data
#  colony_count: count
# end
modify
  y[0]
  location: "DFP.6"
  inuse: 0
end

# todo redo failed colonies here

log
  return: {plates: plates} # put new resulting samples from produce here
end
