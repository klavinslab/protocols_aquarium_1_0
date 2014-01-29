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
  note: "Using fine tipped felt pen and a straight edge, draw a line bisecting the plate, rotate the plate 90 degrees and draw a second line.  You should now have a plate with four even sectors."
  #TODO: Image would be a great idea
end

step
  description: "Take four 1.5 ml centrifuge tubes and pipette 100 uL LB into each one"
end

take
  plate = item e_coli_strain_plate
end
plate = plate[0]

step
  description: "Pick four colonies and transfer a different colony into each of the four 1.5 ml tubes"
  bullet: "find a colony that is not touching any other colony."
  bullet: "take a 200 ul tip (green box) by hand."
  bullet: "With the pipette tip, scrape up the colony and then mix it into one of the 1.5ml tubes."
  bullet: "scrape the end of the tip against the wall of the tube below the liquid level to ensure the colony has been deposited"
  bullet: "repeat the above untill each 1.5 ml tube has a single colony."
  warning: "be gentle.  The agar is soft."
end

step
  description: "deposit each colony into a sector and streak"
  bullet: "pipette 20ul from one of the 1.5 ml tubes on to the outer edge of the plate in the center of one of the sectors"
  bullet: "take a fresh 200 ul tip (green box) by hand"
  bullet: "At a low angle streak the tip starting from the liquid gently drag the tip back and fourth from sector edge to sector edge in non-overlapping lines eventually reaching near the center."
  bullet: "discard the 1.5 ml tube you just used"
  bullet: "repeat until you have run out of tubes and empty sectors"
  warning: "do not cross the sector lines with a streak"
  image: "sector_streak"
end

#TODO: produce this with location 30C incubator
produce
  1 "Agar plate" from plate
  release sector_plate
end

release lb

#TODO:  This should be put in the fridge, not back in the incubator.
release plate