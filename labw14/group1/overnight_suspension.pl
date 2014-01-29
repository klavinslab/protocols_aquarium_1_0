argument
 Transformed_E_coli_Strain_id: sample, "A plate"
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL Test Tube"
  y = item Transformed_E_coli_Strain_id
end

step
 description: "lable a 14 mL Test Tube with your initials and the date"
end

step
 description: "use a 10uL pipette tip to transfer one colony from the plate into your test tube"
 note: "carefully hold the test tube at a steep angle so the pipette tip can reach the fluid, swirl the pipette tip to mix"
end

produce
 r = 1 "overnight suspension culture" of Transformed_E_coli_Strain_id
 note: "Make sure to write the item number on the tube"
 release test_tube
end


 




