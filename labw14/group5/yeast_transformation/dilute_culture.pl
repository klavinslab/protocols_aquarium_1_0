argument
 yeast_overnight_suspension: sample array , "Yeast overnight suspension culture tube"
end

num = length(yeast_overnight_suspension)

step
 description: "This protocol describes how to dilute Yeast overnight suspension culture"
end

take
  media_bottle          = 1 "800 mL YPAD liquid (sterile)"
  serological_pipette   = 1 "Serological Pipette"
  pipette               = num "25 mL Serological Pipette Tips"
  flask                 = num "250 mL Baffled Flask"
  yeast_suspension_tube = item yeast_overnight_suspension
end

step
 description: "Collect yeast overnight suspension tubes"
 note: "Take %{num} yeast overnight suspension tube(s) out of the 30C shaker (location: B13.125)
     and put the tube(s) into a tube holder on your bench."
end

step
 description: "Diluting cells in YPD"
 note: "Pour 25 mil of YPAD into flask. Then, pipette 500 μL of the yeast overnight suspension cultrue into the flask."
 bullet: "Label the flask with your initials and date."
end

ii = 0
r  = []

while ii < length(yeast_overnight_suspension)

  produce
      y = 1 "Yeast Overnight Suspension" from yeast_suspension_tube[ii]
      release flask[ii]
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_250ml_flask: r }
end

step
description: "Reselease/Dispose"
release yeast_suspension_tube
release pipette
end
release concat(media_bottle, serological_pipette)
