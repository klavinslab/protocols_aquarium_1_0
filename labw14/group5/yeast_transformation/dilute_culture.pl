argument
 Yeast_overnight_suspension: sample array , "Yeast overnight suspension culture tube"
end

num = length(Yeast_overnight_suspension)

step
 description: "This protocol describes how to dilute Yeast overnight suspension culture"
end

take
  flask = num "250 mL Baffled Flask"
  media_bottle = "800 mL YPAD liquid (sterile)"
  yeast_suspension_tube = item  Yeast_overnight_suspension
end

step
 description: "Put the Yeast overnight suspension culture tube into a holder"
end

step
 description: "Diluting cells in YPD"
 note: "Pour 25 mil of YPAD into flask. Then, pipette 500 uL of the yeast overnight suspension cultrue into the flask."
 bullet: "Label the flask with your initials and date"
end

ii = 0
r  = []

while ii < length(Yeast_overnight_suspension)

  produce
      y = 1 "Yeast overnight suspension"
  end
  
  r = append(r,y[:id])
  ii=ii+1
end

log
  return: { yeast_250ml_flask: r }
end

release concat(yeast_suspension_tube, media_bottle)
