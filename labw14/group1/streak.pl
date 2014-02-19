argument
  e_coli_glycerol_stock: sample, "Glycerol Stock of frozen cells"
end

take
  sector_plate = 1 "LB Kan Plate (sterile)"
  lb = 1 "50 mL LB liquid aliquot (sterile)"
end

step
  description: "Divide the plate into four even sectors."
  check: "Turn your plate over, agar side up."
  check: "Using fine tipped felt pen and a straight edge, draw a line bisecting the plate, rotate the plate 90 degrees and draw a second line.  You shoμLd now have a plate with four even sectors."
  #TODO: Image woμLd be a great idea
end

#step
#  description: "Take four 1.5 mL tubes and pipette 100 μL LB into each one"
#end

#plate = plate[0]

#step
#  description: "Pick four colonies and transfer a different colony into each of the four 1.5 mL tubes"
#  bullet: "Find a colony that is not touching any other colony."
#  bullet: "Take a 200 μL tip (the one used by the 10-100 μL or 20-200 μL pipettor) by hand."
#  bullet: "With the pipette tip, scrape up the colony and then mix it into one of the 1.5mL tubes. Scrape the end of the tip against the wall of the tube below the liquid level to ensure the colony has been deposited"
#  check: "Repeat the above untill each 1.5 mL tube has a single colony."
#  warning: "Be gentle.  The agar is soft."
#end

step
  description: "Deposit Glycerol stock containing the cells to a sector and streak"
  bullet: "Pipette 5 μL from one of the 1.5 mL tubes on to the outer edge of the plate in the center of one of the sectors"
  bullet: "Take a fresh 200 μL tip by hand"
  bullet: "At a low angle streak the tip starting from the liquid gently drag the tip back and fourth from sector edge to sector edge in non-overlapping lines eventually reaching near the center."
  bullet: "Discard the 1.5 mL tube you just used"
  check: "Repeat until you have run out of empty sectors"
  warning: "Do not cross the sector lines with a streak"
  warning: "Streak lines should not cross"
  warning: "You are not trying to spead the liquid."
  image: "sector_streak"
end

produce
  r = 1 "Agar plate" from sector_plate
  note: "Place the streaked plate upside-down (lid on the bottom) in 30 C incubator at A1.110 overnight."
  release sector_plate
  location: "A1.110"
end

release concat(lb, stock)

#modify
#  plate[0]
#	location: "DFP.0"
#  inuse: 0
#end
