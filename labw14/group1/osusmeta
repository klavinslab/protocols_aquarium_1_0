argument
 Transformed_E_coli_Strain_id: sample, "A plate"
end

step
 description: "This protocol describes the process of overnight suspension"
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
  plate = item Transformed_E_coli_Strain_id
end

step
 description: "Media Preperation"
 check: "Lable a 14 mL Test Tube with your initials and the date"
 check: "Use the 1000uL pipetter to add 2mL from the LB liquid aliquot to the test tube"
end

step
 description: "Add cells to previously prepared growth media."
 note: "Use a 10uL pipette tip to transfer one colony from the plate into your test tube"
 check: "Place a clean tip on the 10uL pipetter"
 check: "Carefully use the tip of the pipetter to scrape up one of the colonies from the plate"
 check: "Eject the pipette tip into 14 mL test tube, swirl tube to mix"
end

produce
 1 "Overnight suspension culture" from plate[0]
 release test_tube
 note: "Place your suspension culture test tube in the 37 C Shaker Incubator"
 location:"B13.425"
end

release concat(falcon_tube, plate)
