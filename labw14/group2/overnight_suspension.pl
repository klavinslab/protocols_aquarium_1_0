argument 
  Transformed_E_coli_Strain_id: sample, "This is the plate that we are drawing colonies from" 
end

take 
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
  plate = item Transformed_E_coli_Strain_id
end

step
  description:
    "Prepare 14 mL test tube for incubation"
end

step
  description:
    "Pipette 2 mL of LB into your test tube"
  note :
    "1. Make sure to not contaminate the LB media.\n
    2. Set the 1 mL pipettor to 100 and pipette the LB solution twice into the tube"
end

step
  description:
    "Pick up a colony"
  note:
    "1. Choose a colony that is medium sized, isolated and round.\n
     2. Label the colony on the back of the plate with your initials. \n
     3. Using a 10 ul pipette tip scrape off a colony."
end

step
  description: 
    "Deposit colony into 14 mL test tube"
  note:
    "1. Take the cap off of the test tube and slightly tilt it. \n
    2. Place the pipette tip with the colony into the solution and swirl gently.\n 
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



  

    
    




  
  
