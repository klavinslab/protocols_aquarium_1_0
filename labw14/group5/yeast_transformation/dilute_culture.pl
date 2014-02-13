argument
 x: sample, "Yeast_plate_from_day_1"
end

step
 description: "This protocol describes how to dilute culture"
end

take
  glycerol_bottle = 1 "50 percent Glycerol (sterile)"
  glycerol_tube = 1 "Cryo tube"
  tube = item Transformed_E_coli_Strain_id
end

step
 description: "Put the overnight suspension culture tube into a holder"
end

step
 description: "Mixing glycerol with cell suspension"
 note: "Pipette 900 uL of the glycerol stock into the Cryo tube. Then pipette 900 uL of the overnight
 suspension culture into the same Cryo tube"
 bullet: "Label the Cryo tube with your initials, date and year"
 bullet: "Vortex the Cryo tube for 15-30 seconds"
 warning: "Be as sterile as possible. Do not touch the inside of the glycerol bottle with either a tip or pipette."
end


produce
 1 "Transformed E coli Glycerol Stock" from tube[0]
 release glycerol_tube
 note: "Place your Cryo tube in the -80 C refrigerator"
end

release [glycerol_bottle[0], tube[0]]
