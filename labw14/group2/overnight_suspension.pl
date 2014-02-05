argument 
  e_id: sample("Transformed E coli plate"), "This is the plate from which we draw colonies" 
end

take 
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
  plate = item e_id
end

step
  description:
    "Prepare 14 mL test tube for incubation"
end

step
  description:
    "Pipette 2 mL of LB into your test tube"
  note :
    "NOTE: NEVER CONTAMINATE LB MEDIA.\n
    Use the 1000 uL pippete to add 2mL of LB into your tube. "
end

step
  description:
    "Pick up a colony"
  note:
    "1. Locate a colony that is medium sized, isolated and round.\n
     2. Label it on the back of the plate with your initials. \n
     3. Using a 10 ul pipette tip scrape off the colony."
end

step
  description: 
    "Deposit colony into 14 mL test tube"
  note:
    "1. Take the cap off of the test tube and slightly tilt it. \n
    2. Place the pipette tip with the colony into the test tube solution and swirl gently.\n 
    3. Take the tip out and discard it. "
end

produce
  t = 1 "Overnight suspension culture" from plate[0]
  note: "Keep on bench"
  location: "Bench"
end 

step
  description:
      "Store tube in incubator"
  note:
    "Store the tube in the 37 degC shaker incubator located at B13.425."
end

release [falcon_tube[0], plate[0]]



  

    
    




  
  
