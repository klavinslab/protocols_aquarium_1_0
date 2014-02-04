# Protocol to transfer colonies from tube to plate
#
#Authors: Pramod Chavali, Patrick Ma
#
# January 29, 2014
##

argument
  Transformed_E_coli_Strain_id: sample, "Use the plate you transformed yesterday
end


step
  description: "Wear gloves"
  note: "please put on a pair of gloves"
end

take
  plate = item Transformed_E_coli_Strain_id
  note: "Place the items on the bench. Check the LB aliquot for contamination by swirling it and holding it up to the light to watch for suspended particles."
  
  lb = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
end

step
  description: "Label test tube"
  note: "Label the test tube with your initials and the date"
end

step
  description: "Set Micropipettor"
  note: "Take the 1000uL micropipettor and set to 1000uL"
end

step
  description: "Prepare culture tube"
  bullet: "Loosen cap of LB aliquot"
  bullet: "Put tip in pipette and add 1 mL of of LB in 14 ml test tube (culture tube)"
  bullet: "Discard tip and repeat previous step for a total of 2 ml in the test tube"
  bullet: "Recap LB aliquot"
end

step
  description: "Next you will transfer a colony to the test tube"
end

step
  description: "Select Colony"
  note: "Find a colony on your plate that is isolated, medium sized, and round. Circle the chosen colony on the back of the plate"
end

step
  description: "Transfer Colony"
  bullet: "Take a pipette tip"
  bullet: "Carefully lift off the selected colony from the plate"
  bullet: "Scrape pipette tip onto side of culture tube so that the cells are suspended in the media."
  bullet: "Discard tip"
  bullet: "Place lid on culture plate and reseal with parafilm"
end

produce
  1 "Overnight suspension culture" from plate[0]
  note: "Place 14 ml test tube in 37.0 degree incubator"
  location: "B13.425"
  release test_tube[0]
end

release [plate[0], lb[0]]
