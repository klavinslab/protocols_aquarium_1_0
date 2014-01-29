argument 
  Transformed_E_coli_Strain_id: sample, "This is the plate that we are drawing colonies from" 
end

take 
  falcon_tube = 1 "50 mL LB liquid aliqout (sterile)"
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
    "Make sure to not contaminate the LB media.\n
    Set the 1 mL pipettor to 100 and pipette the LB solution twice into the tube"
end

step
  description:
    "Pick up a colony"
  note:
    "Make sure to choose a colony that is medium sized, isolated and round.\n
     Label the colony on the back of the plate with your initials. \n
     Using a 100ul pipette tip scrape off a colony."
end

step
  description: 
    "Deposit colony into 14 mL test tube"
  note:
    "Take the cap off of the test tube and lightly tilt the tube until the solution is close to the top. \n
    Take the pipette tip with the colony and place the tip into the solution and swirl gently.\n 
    Take the tip out and discard it. \n
    Recap the test tube."
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



  

    
    




  
  
