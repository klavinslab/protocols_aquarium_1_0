argument
 Transformed_E_coli_Strain_id: sample array, "A plate"
end

step
 description: "This protocol describes the process of overnight suspension"
end

take
  plate = item Transformed_E_coli_Strain_id
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
end

len = length(plate)
take
  test_tube = len "14 mL Test Tube"
  
end

step
 description: "Media Preperation"
 check: "Lable a 14 mL Test Tube with your initials and the date"
 check: "Use the 1000uL pipetter to add 2mL from the LB liquid aliquot to each of the test tube"
end

step
 description: "Add cells to previously prepared growth media."
 note: "Use a 10uL pipette tip to transfer one colony from the plate into your test tube"
 check: "Place a clean tip on the 10uL pipetter"
 check: "Carefully use the tip of the pipetter to scrape up one of the colonies from the plate"
 check: "Eject the pipette tip into 14 mL test tube, swirl tube to mix"
 check: "Do these steps for all the test tubes"
end

x = 0
r = []
while x < length(plate)
 produce
  r1 = 1 "Overnight suspension culture" from plate[x]
  note: "Place your suspension culture test tube %{x} in the 37 C Shaker Incubator"
  location:"B13.425"
 end
 r = append(r,r1[:id])
 x = x+1
end

#release [concat(falcon_tube, plate), test_tube]
release concat(falcon_tube, test_tube)
release plate

log
 return: {Transformed_E_coli_Strain_id: r}
end
