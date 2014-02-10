argument
 Transformed_E_coli_Strain_id: sample array, "A tube with overnight suspension culture"
end

step
 description: "This protocol describes how to make glycerol stock"
end

take
  glycerol_bottle = 1 "50 percent Glycerol (sterile)"
  tube = item Transformed_E_coli_Strain_id
end

len1 = length(tube)
take 

   glycerol_tube = len1 "Cryo tube"
end

step
 description: "Put the overnight suspension culture tubes into a holder"
end

step
 description: "Mixing glycerol with cell suspension"
 note: "Pipette 900 uL of the glycerol stock into each of the Cryo tubes. Then pipette 900 uL of the overnight
 suspension culture into each of the same Cryo tubes"
 bullet: "Label the Cryo tubes with your initials, date and year"
 bullet: "Vortex the Cryo tubes for 15-30 seconds"
 bullet: "Make sure you have done this for all the cyro tubes"
 warning: "Be as sterile as possible. Do not touch the inside of the glycerol bottle with either a tip or pipette."
end

x = 0

r2 = []
while x < length(tube)
 produce
  r3 = 1 "Transformed E coli Glycerol Stock" from tube[x]
  
  note: "Place your Cryo tubes in the -80 C refrigerator"
 end
 r2 = append(r2,r3[:id])
 x = x + 1
end

release glycerol_bottle
release tube
