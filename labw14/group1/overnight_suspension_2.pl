argument
  
  Transformed_E_coli_Strain_id: sample, "The plate containing the grown colonies"
  
end

take
  plate = item Transformed_E_coli_Strain_id
end
  
take
  tube = 1 "14 mL test tube from media bayitem Transformed_E_coli_Strain_id
  location: "B1.450"
end

step

  release plate
  
end
