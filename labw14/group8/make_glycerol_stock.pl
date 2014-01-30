argument
  
  Transformed_E_coli_Strain_id: sample, "The tube containing the overnight suspended colonies"
  
end

step
  note: 
    "This protocol describes the process for preparing a transformed and suspended strain 
     for long-term storage (even for 10's of years). We make a 50 / 50 by volume combination with a 50%% glycerol
     solution. A summary is shown below."
  check: "Check that you are wearing gloves and your station is clean"
  check: "Take the suspended strain, gylcerol stock, and a cryo tube that will hold the result"
  check: "Pipette 900 microliters of glycerol stock, then the same amount from the strain, into the cryo tube. (3 steps)"
  check: "Store the result (1 step)"
  check: "Return glycerol stock, tidy your station, and dispose of suspended strain with proper sterile technique. (3 steps)"
end

take
  strain = item Transformed_E_coli_Strain_id
  glycerol = 1 "50 percent Glycerol (sterile)"
  result_tube = 1 "Cryo Tube"
  note: "Place the cryo tube in a holder and the tube with suspended culture in a tube rack, both on the bench. The gylcerol can be set on the bench."
end


step
  description: "Prepare a 50 / 50 by volume combination of the strain and 50%% glycerol"
  check: "Take the 1000uL micropipettor and set to 900uL"
  check: "Loosen the cap on the gylcerol stock and the cryo tube"
  check: "Pipette from the glycerol stock to the cryotube. Be sure to not touch the inside of the glycerol container to maintain its sterility."
  check: "Pipette from the suspended strain into the cryotube."
end

produce
   r = 1 "Transformed E coli Glycerol Stock" from strain[0]
   note: "Also label the cryo tube on the side (not cap) with your initials and the date (with year, since it may be in storage for decades)."
   release result_tube
end



step
  description: "Return materials"
  note: "Return glycerol stock, tidy your station, and dispose of suspended strain with proper sterile technique. (3 steps)"
  check: "Return the glycerol stock to its original location"
  check: "Take the suspended colony tube to the dish cleaning station. Add twice to 3x its orignal volume of 20%% bleach. Recap the tube and place it in the dirty tube rack."
  check: "Clean your station and dispose of your gloves"
end



release glycerol
release strain
