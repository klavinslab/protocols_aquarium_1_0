argument
 Transformed_E_coli_Strain_tube: sample, "An overnight suspension of transformed E. Coli cells (in culture tube)"
end

step
 description: "This protocol decribes a method for preparing cells for long-term storage in glycerol stock."
end

take
  cell_culture_tube = item Transformed_E_coli_Strain_tube
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = 1 "Cryo Tube"
  note: "Be sure to use STERILE technique when removing cryo tubes from their container. This means:
         shake out one of the sterile tubes into your gloved hand while holding the outside of the bag,
         rather than putting your hand into the bag to take one out."
end

step
 description: "Suspend the overnight cell culture in 50%% gylcerol"
 check: "Pipette 900uL of the 50%% glycerol stock to the 1.5mL sterile tube"
 note: "Be sure to use STERILE technique while handling the gylcerol stock.  If you contaminate this stock
        it wil ruin everyone else's experients! This means:"
 note: " - Loosen caps before loading the pipette tip"
 note: " - Hold the cap in your gloved hand while extracting fluid with the micro-pipetter, rather than placing it on the lab bench."
 note: " - Do not touch the inside of the tube with the micropipetter."
 note: " - Do not re-use pipette tips."
 check: "Pipette 900uL of cell suspension into the 1.5mL sterile tube"
 check: "Vortex the 1.5mL sterile tube for 15s at speed 10 using the VWR analog vortex mixer."
end

produce
 s = 1 "transformed E. Coli in 50% glycerol" from cell_culture_tube[0]
# note: "Make sure to also add your initials and todays date (mm/dd/yyyy) in addition to the item ID number.
 #       This glycerol/cell culture mixture will potentially be stored in the -80 C freezer for many months,
  #      so be sure to label both the cap and the side of the tube for redundancy."
end

#release [cell_culture_tube[0], glycerol[0]]
release concat(cell_culture_tube, glycerol)
