# Protocol to transfer colonies from tube to plate
#
#Authors: Pramod Chevali, Patrick Ma
#
# January 29, 2014
##

argument
  Transformed_E_coli_Strain_id: sample, "Use the plate you transformed yesterday"
end


step
  description: "Wear gloves"
  note: "please put on a pair of gloves"
end

take
  plate = item Transformed_E_coli_Strain_id
  note: "Place the items on the bench"
  
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
  bullet: "Put tip in pipette and add 2 mL of of LB in 14 ml test tube (culture tube)"
  bullet: "recap LB aliquot"
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
  note: "Take a pipette tip an carefully lift off the selected colony from the plate and scrape onto side of culture tube so that the cells are suspended in the media."
end

produce
  1 "Overnight suspension culture" from plate[0]
  note: "Put in 37.0 degree incubator"
  location: "B13.425"
  release test_tube[0]
end

release [plate[0], lb[0]]
