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
    "Put the camera hood on transilluminator"
  note: 
    "Go the the Gel room, place the agar part of the plate inverted on the transilluminator.
     Place the camera hood on the transilluminator. Turn on transilluminator by sliding you hand into the hood.\n"
end

step
  description: 
    "Take a picture using the camera and remote shooting software on the computer"
  check:
    "Turn on the camera if it is off"
  check:
    "Open EOS Utility software on the desktop, and click Camera Settings/Remote Shooting"
  check:
    "In the pop up window EOS Rebel T3, make sure the settings are 2'', F4.5, ISO100, Tungsten(light bulb icon), S1."
  check: 
    "click Live View shoot and in the pop up Remote Live View Window, click Test shooting"
  check:
    "If the Test shooting image looks focused, go back to the EOS Rebel T3 window and click the the black round shutter botton"
  check:
    "If the Test shooting image is not focused or the software shows Focus failure, go to the Remote Live View Window, in the focus
    section, adjust the focus by clicking the <<< << < > >> >>> buttons until the live image looks focused. Then go back to the EOS 
    Rebel T3 window and click the the black round shutter botton"
end


step
  description: 
    "IMPORTANT: Rename the picture in Dropbox"
  note: 
    "Open Dropbox/GelImages,
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
    "Record the count. Screenshot the image of counted cells."
  bullet:
    "IF the software recognizes the colonies correctly and gives a reasonbale count, record
     that number below." 
  bullet: "IF NOT, count the number of colonies by hand and use this as the colony count." 
  bullet: "Take a screenshot of the final image with colonies circled by the software and save 
     it in the same dropbox folder as the plate's original image. Save it as plate_id_count.
     I.e if the plate had id 798 save it as plate_798_count."
  warning: "Make sure the number you enter here as the colony count is an accurate representation of how many actual colonies are on the plate.
  If the software returned an innacurate count, do not record that. Record your hand-counted/estimated value instead."
  getdata
    count: number, "Enter the count."
  end
end

step
  description: 
    "Store the plate in 4C fridge."
  note:
    "Turn off the transillumniator and camera, remove the camera hood, take the plate from transilluminator, wrap up
     the plate with parafilm and put it the in the Box 0 in deli fridge located at D2.100."
end

step
  description: "Is there any reason to discard the colony count data from this protocol?"
  bullet: "1 - No, the data from this protocol is clean"
  bullet: "2 - Plating was done incorrectly"
  bullet: "3 - I was unable to get/enter an accurate cell count"
  getdata
    colony_data_status: number, "Select one of the following:", [1,2,3]
  end
end

log
  return: { colony_data_status : colony_data_status }
end

modify
  y[0]
  location: "DFP.0"
  inuse: 0
end

