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
 check: "Lable each 14 mL Test Tube with your initials and the date"
 check: "Use the 1000uL pipetter to add 2mL from the LB liquid aliquot to each of the test tubes"
end

step
 description: "Add cells to previously prepared growth media using the following procedure."
 note: "Carefully use the tip of the 10 uL pipetter to scrape up one of the colonies from the plate"
 note: "Transfer this colony into a test tube"
 note: "Eject the pipette tip into 14 mL test tube, swirl tube to mix.  Repeat for each of the eight tubes."
 warning: "Be sure to place a clean tip on the 10uL pipetter after transfering each colony"
end

x = 0
r = []
while x < length(plate)
 produce
  r1 = 1 "Overnight suspension culture" from plate[x]
  note: "Place each suspension culture test tube %{x} in the 37 C Shaker Incubator"
  location:"B13.425"
 end
 r = append(r,r1[:id])
 x = x+1
end

#release [concat(falcon_tube, plate), test_tube]
release falcon_tube
release plate

log
 return: {Transformed_E_coli_Strain_id: r}
end
