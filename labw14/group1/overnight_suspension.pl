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
 description: "Lable a 14 mL Test Tube with your initials and the date"
end

step
 description: "Use the 1000uL pipette to add 2mL from the LB liquid aliquot to the test tube"
end

step
 description: "Use a 10uL pipette tip to transfer one colony from the plate into your test tube"
 note: "Carefully hold the test tube at a steep angle so the pipette tip can reach the fluid, swirl the pipette tip to mix"
end

produce
 1 "Overnight suspension culture" from plate[0]
 release test_tube
 note: "Place your suspension culture test tube in the 37 C Shaker Incubator"
 location:"B13.425"
end

release [falcon_tube[0], plate[0]]
#release concat(falcon_tube, plate)

 




