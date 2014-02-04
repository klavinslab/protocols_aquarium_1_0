argument
 Transformed_E_coli_Strain_id: sample, "An overnight suspension of transformed E. Coli cells (in culture tube)"
end

step
 description: "This prodocol decribes the method for preparing cells for long-term storage in glycerol stock."
end

take
  cell_culture_tube = item Transformed_E_coli_Strain_id
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = 1 "Cryo Tube"
  note: "Be sure to use sterile technique when removing cryo tubes from their container. This means:"
  note: " - shake out one of the sterile tubes into your gloved hand while holding the outside of the bag,
         rather than putting your hand into the bag to take one out."
end

step
 description: "Suspend the overnight cell culture in 50%% gylcerol"
 check: "Pipette 900uL of the 50%% glycerol stock to the 1.5mL sterile tube"
 note: "Be sure to use STERILE technique while handling the gylcerol stock.  If you contaminate this stock
        it wil ruin everyone else's experients! This means:"
 note: " - Loosen caps before loading the pipette tip"
 note: " - Do not touch the inside of the jar with the micropipetter."
 note: " - Hold the cap in your hand while extracting fluid with the micro-pipetter, rather than placing it on the lab bench."
 note: " - Do not re-use pipette tips."
 check: "Pipette 900uL of cell suspension into the 1.5mL sterile tube"
 check: "Vortex the 1.5mL sterile tube for 15s on high power. Use the more powerful VWR analog vortex mixer at speed 10."
end

produce
 s = 1 "Transformed E coli Glycerol Stock" from cell_culture_tube[0]
 note: "Make sure to also add your initials and todays date (mm/dd/yyyy) in addition to the item ID number."
 note: "This glycerol/cell culture mixture will potentially be stored in the -80 C freezer for many months,
        so be sure to label both the cap and the side of the tube for redundancy."
end

#release [cell_culture_tube[0], glycerol[0]]
release concat(cell_culture_tube, glycerol)
