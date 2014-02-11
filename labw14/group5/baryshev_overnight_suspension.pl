argument
 Transformed_E_coli_Strain_id: sample array, "A plate"
end

num = length(Transformed_E_coli_Strain_id)

step
 description: "This protocol describes the process of overnight suspension"
 warning: "You're going to make %{num} overnight suspension culture tubes"
end

take
  falcon_tube = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = num "14 mL Test Tube"
  plate = item Transformed_E_coli_Strain_id
end

step
 description: "Media Preperation"
 check: "Lable %{num} 14 mL Falcon Test Tube with your initials and the date"
end

ii = 0
r  = []

while ii < length(Transformed_E_coli_Strain_id)

ind = ii+1

 step
     description: "Pouring LB media to the test tube N%{ind}"
     check: "Use the 1000uL pipetter to add 2mL from the LB liquid aliquot to the test tube N%{ind}"
 end

 step
     description: "Add cells to previously prepared growth media."
     note: "Use a 10uL pipette tip to transfer one colony from the plate into your test tube"
     check: "Place a clean tip on the 10uL pipetter"
     check: "Carefully use the tip of the pipetter to scrape up one of the colonies from the plate"
     check: "Eject the pipette tip into 14 mL test tube, swirl tube to mix"
 end

 produce
     y = 1 "Overnight suspension culture" from plate[ii]
     release test_tube
     note: "Write the above id number on the tube's side. Place your suspension culture test tube in the 37 C Shaker Incubator"
     location:"B13.425"
 end
 
 r = append(r,y[:id])
 ii=ii+1
end

log
   return: { overnight_suspension_id: r}
end

release concat(falcon_tube, plate)
