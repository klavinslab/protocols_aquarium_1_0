argument
  id: sample ("Transformed E coli Strain"), "This is the glycerol stock we will use to prepare the cells"
end

take
  liquid_LB 1 "50 mL LB liquid aliquot (sterile)"
  test_tube 1 "14 mL Test Tube"
  glycerol = item id
end
  
step
  description: 
      "Prepare 14 mL test tube for incubation"
  note:
      "Click next to begin the incubation process"
end

step
  description:
      "Pour liquid LB"
  note:
      "Pipette 2mL of liquid LB into the 14 mL test tube. Make sure to use a fresh sterile pipette tip"
end

step
  description: 
      "Mix in glycerol stock"
  warning: "BE EXTREMELY CAREFUL NOT TO CONTAMINATE THE GLYCEROL STOCK!"
  bullet: "Tilt test tube slightly so that the liquid LB is on the side of the tube"
  bullet: "Using a fresh 1mL pipette tip scrape a small amount of glycerol stock into the tube"
  bullet: "swirl the tip gently into the test tube, and dispose of the pipette tip"
end

step
  description:
      "Incubate test tube"
  note:
      "Put the test tube in the 37 degree shaker incubator located at B13.425"
end

release [liquid_LB[0], glycerol[0]]
