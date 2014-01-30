argument
  e_coli_strain_plate: sample, "Your plated E. coli"
end

take
  sector_plate = 1 "LB Kan Plate (sterile)"
  lb = 1 "50 mL LB liquid aliquot (sterile)"
end

step
  description: "Turn your plate over, agar side up."
end

step
  description: "Divde the plate into four even sectors."
  note: "Using fine tipped felt pen and a straight edge, draw a line bisecting the plate, rotate the plate 90 degrees and draw a second line.  You shoμLd now have a plate with four even sectors."
  #TODO: Image woμLd be a great idea
end

step
  description: "Take four 1.5 mL tubes and pipette 100 μL LB into each one"
end

take
  plate = item e_coli_strain_plate
end
#plate = plate[0]

step
  description: "Pick four colonies and transfer a different colony into each of the four 1.5 mL tubes"
  check: "Find a colony that is not touching any other colony."
  check: "Take a 200 μL tip (the one used by the 10-100 μL or 20-200 μL pipettor) by hand."
  check: "With the pipette tip, scrape up the colony and then mix it into one of the 1.5mL tubes. Scrape the end of the tip against the wall of the tube below the liquid level to ensure the colony has been deposited"
  check: "Repeat the above untill each 1.5 mL tube has a single colony."
  warning: "Be gentle.  The agar is soft."
end

step
  description: "Deposit each colony into a sector and streak"
  check: "Pipette 20 μL from one of the 1.5 mL tubes on to the outer edge of the plate in the center of one of the sectors"
  check: "Take a fresh 200 μL tip by hand"
  check: "At a low angle streak the tip starting from the liquid gently drag the tip back and fourth from sector edge to sector edge in non-overlapping lines eventually reaching near the center."
  check: "Discard the 1.5 mL tube you just used"
  check: "Repeat until you have run out of tubes and empty sectors"
  warning: "Do not cross the sector lines with a streak"
  warning: "Streak lines should not cross"
  warning: "You are not trying to spead the liquid.  You are just trying to get some cells on the tip so you deposit individual cells as you streak.  That 5 μl probably have 10,000 cells and you only want one by the end of the streak."
  image: "sector_streak"
end

step
  description: "Store the plate %{e_coli_strain_plate} in 4C fridge."
  note: "Wrap up the plate with id %{e_coli_strain_plate} using parafilm and put it in the Box 1 in deli fridge located at D2.100."
end


produce
  1 "Agar plate" from plate[0]
  note: "Place the streaked plate upside-down (lid on the bottom) in 30 C incubator at A1.110"
  release sector_plate
  location: "A1.110"
end

release lb

modify
  plate[0]
	location: "DFP.0"
  inuse: 0
end
