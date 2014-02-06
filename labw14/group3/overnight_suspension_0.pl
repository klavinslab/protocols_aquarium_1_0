argument
  Transformed_E_coli_Strain_id: sample, "Choose the plate you incubated yesterday"
end

take
  cell_plate = item Transformed_E_coli_Strain_id
  aliquot = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
end

step
  description: 
    "This protocol describes how to create an overnight colony suspension using the colonies of a previously incubated   plate"
end

step
  description: "Label a 14 mL tube with your initials AND date"
  note: "place the tube in a test tube rack.\n
  This tube will eventually hold the transformed cells"
end

step
  description: "Pipette 2 mL of LB into 14 mL tube"
  note: "Use proper sterile technique. Use the 1000 μL pipetter."
  bullet: "Set pipetter to 1000μL"
  bullet: "Loosen cap on LB aliquot"
  bullet: "Pipette 2 mL of LB into 14 mL tube"
  bullet: "Recap test tube and LB"
  warning: "Use new tip after every ejection"
end

step
  description: "Add a colony to suspension"
  note: "Select desired colony prior to opening plate. Mark desired colony with circle and intials and date"
  note: "Selection of your colony should be based on size (medium-big, not too big), isolated, and round in shape." 
  bullet: "Take a sterile pipette tip, pick up your desired colony by gently scraping the tip to the colony."
  bullet: "Tilt 14 mL tube such that you can reach the broth with your tip."
  bullet: "Scrape colony into broth, using a swirling motion"
  warning: "!DON'T SPILL THE BROTH!"
end

produce
  s = 1 "Overnight suspension culture" from cell_plate[0]
  note: "Place in 37 degree incubator at B13.425 for 18-24 hours"
  location: "B13.425"
end

step
  description: "Return all equipment to specified areas"
  note: "Remember to wrap plate with parafilm"
  check: "Return test tube rack to Bench"
end

release concat(cell_plate, aliquot)

log
  return: { sus_id: s[:id]}
end
