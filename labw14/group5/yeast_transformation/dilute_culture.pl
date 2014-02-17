argument
 yeast_overnight_suspension: sample array , "Yeast overnight suspension culture tube"
end

num = length(yeast_overnight_suspension)

if num == 1
 step
  description: "This protocol describes how to dilute yeast overnight suspension culture"
   note: "You will be asked to dilute one yeast overnight suspension culture."
 end
else
 step
  description: "This protocol describes how to dilute yeast overnight suspension culture"
   note: "You will be asked to dilute %{num} yeast overnight suspension cultures."
 end
end

take
  media_bottle          = 1 "800 mL YPAD liquid (sterile)"
  serological_pipette   = 1 "Serological Pipette"
  pipette               = num "25 mL Serological Pipette Tips"
  flask                 = num "250 mL Baffled Flask"
end

ii  = 0
r   = []


while ii < length(yeast_overnight_suspension)

  id_num = yeast_overnight_suspension[ii]

  take
    yeast_suspension_tube = item yeast_overnight_suspension[ii]
    note: "Take a yeast overnight suspension tube with id %{id_num} out of the 30C shaker (location: B13.125)
       and put the tube into a tube holder on your bench."
  end

  step
    description: "Diluting cells in YPD"
    bullet: "Take a 250mL flask. Label the flask with your initials and date."
    bullet: "Using serological pipette pour 25 mL of YPAD media from the 800 mL YPAD liquid media bottle into the flask."
    bullet: "Then, using 1000 μL pipette pour 500 μL of the yeast overnight suspension culture
           from the 14mL falcon tube with id %{id_num} into the flask."
  end

  produce
      y = 1 "Yeast Overnight Suspension" from yeast_suspension_tube[0]
      release flask[ii]
      note: "Write the above id number on the flask's side. Place the flask in the 30 C Shaker Incubator located at B13.125."
      location:"B13.125"
  end

  step
    description: "Release the following item:"
    note: "Bear the falcon tube with id %{id_num} to the washing station located at A.100. Add 20%% bleach to the tube and place it
           into a tube holder beside the sink."
    warning: "When done, click Next and check the box on the next page."
  end
  
  release yeast_suspension_tube

  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_250ml_flask: r }
end


release pipette
release concat(media_bottle, serological_pipette)


step
  description: "Now you have to wait 5 hours till the next protocol (Harvesting the cells)."
end
