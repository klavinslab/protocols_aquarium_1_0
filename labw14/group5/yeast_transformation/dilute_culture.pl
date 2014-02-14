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

ii  = 0
ind = 0
r   = []

while ii < length(yeast_overnight_suspension)

  ind = ind + 1

  step
    description: "Diluting cells in YPD"
    bullet: "Using %{serological_pipette} serological pipette pour 25 mil of YPAD into the flask N%{ind}."
    bullet: "Then, using 1000 μL pipette pour 500 μL of the yeast overnight suspension cultrue into the flask."
    bullet: "Label the flask with your initials and date."
  end

  produce
      y = 1 "Yeast Overnight Suspension" from yeast_suspension_tube[ii]
      release flask[ii]
      note: "Write the above id number on the flask's side. Place the flask in the 30 C Shaker Incubator."
      location:"B13.125"
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_250ml_flask: r }
end


release yeast_suspension_tube
release pipette
release concat(media_bottle, serological_pipette)
