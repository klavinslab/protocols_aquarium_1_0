argument
 Yeast_overnight_suspension: sample array , "Yeast overnight suspension culture tube"
end

step
 description: "This protocol describes how to dilute culture"
end

take
  falcon_tube = 1 "50 mL Falcon Tube"
  flask = 1 "???"
  YPAD = 1 "???"
  Yeast_culture = item : Yeast_overnight_suspension_culture
end

step
 description: "Put the Yeast overnight suspension culture tube into a holder"
end

step
 description: "Diluting cells in YPD"
 note: "Pour 25 mil of YPAD into flask. Then, pipette 500 uL of the yeast overnight suspension cultrue into the flask."
 bullet: "Label the flask with your initials and date"
end


produce
 1 "Diluted Yeast overnight culture" from flask[0]
 release falcon_tube
 note: "Place your flask"
end

release [YPAD[0], tube[0]]
