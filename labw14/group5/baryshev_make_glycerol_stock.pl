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

  step
      description: "Mixing glycerol with cell suspension"
      note: "Pipette 900 uL of the glycerol stock into the Cryo tube. Then pipette 900 uL of the overnight
         suspension culture into the same Cryo tube N%{ind}"
      bullet: "Vortex the Cryo tube for 15-30 seconds"
      warning: "Be as sterile as possible. Do not touch the inside of the glycerol bottle with either a tip or pipette."
  end


  produce
     1 "Transformed E coli Glycerol Stock" from tube[ii]
     release glycerol_tube[ii]
     note: "Place your Cryo tube in the -80 C refrigerator"
  end
  
end

release [glycerol_bottle[0], tube[0]]
