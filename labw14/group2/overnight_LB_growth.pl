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

produce
  r = 1 "Overnight suspension cultures" from glycerol[0]
  location: "B13.425"
  note: "Label this with item id and initials and store in the shaker incubator overnight"
end

log
  return: { ons: r[:id] }
end
    
release [falcon_tube[0], glycerol[0]]
