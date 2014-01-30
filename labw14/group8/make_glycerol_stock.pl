argument
  
  Transformed_E_coli_Strain_id: sample, "The tube containing the overnight suspended colonies"
  
end

step
  description: 
    "This protocol describes the process for preparing a transformed strain (that has been suspended overnight) 
     for long-term storage (even for 10's of years), by making a 50 / 50 by volume combination with a 50% glycerol
     solution. The steps are below. Check them off as you read them, then continue on."
  check: "Take the suspended strain, gylcerol stock, and a cryo tube that will hold the result"
  check: "Pipette 900 microliters of glycerol stock, then the same amount from the strain, into the cryo tube. (3 steps)"
  check: "Store the result (1 step)"
  check: "Return glycerol stock, tidy your station, and dispose of suspended strain with proper sterile technique. (3 steps)"
end

take
  description: "First we take the suspended strain from it's location (one of the 37C suspenders ie SI3), gylcerol stock, and a cryo tube that will hold the result."
  strain = item Overnight_Suspension_Culture_id
  glycerol = 1 "50 percent Glycerol (sterile)"
  result_tube = 1 "Cyro Tube"
end


step 
  description: "Pipette 900 microliters of glycerol stock, then the same amount from the strain with a different tip, into the cryo tube."
  
  check: "Label the 14 mL test tube."
  check: "Use 1000 uL pipetter to pipett 2 mL of LB Aliquot to the test tube"
  warning: "Make sure that the LB media is not contaminated"
  warning: "Make sure that the test tube is capped after transfer of LB Media"
  warning: "Do not let the pipetter itself touch the LB media"
end 

step

  description: "Store the result in the -80C fridge"
  note: "We will add a tranformed E Coli colony to the prepared media"
  check: "Remove the parafilm from the plate"
  check: "Use a pipetter tip to pick 1 colony from the plate"
  check: "Carefully tilt your labeled test tube and scrap the colony inside the media"
end

step

  description: ""Return glycerol stock, tidy your station, and dispose of suspended strain with proper sterile technique. (3 steps)""
  note: "We will add a tranformed E Coli colony to the prepared media"
  check: "Remove the parafilm from the plate"
  check: "Use a pipetter tip to pick 1 colony from the plate"
  check: "Carefully tilt your labeled test tube and scrap the colony inside the media"
end

produce

   r = 1 “Transformed E coli Glycerol Stock” from strain[0]
   location: "B13.425"
   note: "We will now incubate the cells in the 37C Shaker Incubator"
end

objects = concat(glycerol)
release objects
