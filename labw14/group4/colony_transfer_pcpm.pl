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
  note: "Place the transformed plate on the bench"
  
  lb = 1 "50 mL LB liquid aliquot (sterile)"
  test_tube = 1 "14 mL TestTube"
end


release plate
