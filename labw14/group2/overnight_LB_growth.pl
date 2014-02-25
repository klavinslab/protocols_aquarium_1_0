argument
  id: sample ("Transformed E coli Strain"), "This is the glycerol stock we will use to prepare the cells"
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
  glycerol = item id
end
  
step
  description: "Prepare 14 mL test tube for incubation"
  note: "Click next to begin the incubation process"
  warning: "This procedure must be done before the glycerol stock thaws!"
end

step
  description: "Pipette liquid LB into test tube"
  note: "Pipette 2mL of liquid LB into the 14 mL test tube. Make sure to use a fresh sterile pipette tip"
end

step
  description: "Mix in glycerol stock"
  warning: "BE EXTREMELY CAREFUL NOT TO CONTAMINATE THE GLYCEROL STOCK!"
  bullet: "Using a fresh 1mL pipette tip scrape a small amount of glycerol stock onto the pipette tip"
  bullet: "Tilt test tube slightly so that the liquid LB is on the side of the 14 mL test tube"
  bullet: "swirl the tip gently into the LB solution in the test tube, and dispose of the pipette tip"
end

release [glycerol[0]]

take
  amp = 1 "100X 1 mL Ampicillin Aliquot"
  kan = 1 "200X 1 mL Kanamycin Aliquot"
  note: "These are in a box labeled antibotics in the specified fridge"
end

step
  description: "Pipette antibotics"
  bullet: "Pipette 20 microL of Ampicillin into the test tube"
  bullet: "Pipette 10 microL of Kanamycin into the test tube"
end

release [amp[0],kan[0]]

produce
  r = 1 "Overnight suspension culture" from glycerol[0]
  location: "B13.425"
  note: "Label this with item id and initials and store in the shaker incubator overnight"
end

log
  return: { ons: r[:id] }
end
    
release [falcon_tube[0]]
