argument
  
  Transformed_E_coli_Strain_id: sample, "The plate containing the grown colonies"
  
end

step
  description: 
    "This protocol describes the process for overnight suspension of transformed E Coli strains." 
end

take
  plate = item Transformed_E_coli_Strain_id
end
  
take
  tube = 1 "14 mL test tube from media bay"
end


release plate
 

