argument
 Transformed_E_coli_Strain_id: sample array, "A tube with overnight suspension culture"
end

num = length(Transformed_E_coli_Strain_id)

step
 description: "This protocol describes how to make glycerol stock"
 warning: "You're making %{num} glycerol stocks"
end

take
  glycerol_bottle = 1 "50 percent Glycerol (sterile)"
  glycerol_tube = num "Cryo tube"
  tube = item Transformed_E_coli_Strain_id
end

step
 description: "Perpform the following things before we proceed"
 check: "Put the overnight suspension culture tube into a holder"
 check: "Label %{num} Cryo tubes with your initials, date and year"
end


ii = 0


while ii < length(Transformed_E_coli_Strain_id)

  ind = ii+1

  culture_id_num = tube[ii][:id]

  step
      description: "Mixing glycerol with cell suspension in the tube N%{ind}"
      note: "Pipette 900 uL of the glycerol into the Cryo tube  N%{ind}. Then pipette 900 uL of the overnight
         suspension culture' tube %{culture_id_num} into the same Cryo tube N%{ind}"
      bullet: "Vortex the Cryo tube for 15-30 seconds"
      warning: "Be as sterile as possible. Do not touch the inside of the glycerol bottle with either a tip or pipette."
  end


  produce
     1 "Transformed E coli Glycerol Stock" from tube[ii]
     release glycerol_tube[ii]
     note: "Write the above id number on the tube's cap. Place your Cryo tube in the -80 C refrigerator"
  end
  
  ii = ii+1
end

release concat(glycerol_bottle, tube)
