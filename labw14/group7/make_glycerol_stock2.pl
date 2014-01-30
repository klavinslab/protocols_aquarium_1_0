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
  note: "Be sure to use sterile technique when removing cryo tubes from theie container"
end

step
 description: "Mix the 50%% gylcerol with the overnight cell culture"
 check: "Add 900uL 50%% glycerol stock to the 1.5mL sterile tube"
 note: "Be sure to use STERILE technique while handling the gylcerol stock.  If you contaminate this stock
        it wil ruin everyone else's experients! This means: loosen caps before loading the pipette tip, and
        do not touch the inside of the jar with the micropipetter"
 check: "Add 900uL cell culture to the 1.5mL sterile tube"
 check: "Vortex the 1.5mL sterile tube for 20sec on high"
end

produce
 s = 1 "Transformed E coli Glycerol Stock" from cell_culture_tube[0]
 note: "Make sure to also add your initials and todays date (mm/dd/yyyy).  This sample will potentially be
        kept in the freezer for many months, so be sure to label both the cap and the side of the tube for
        redundancy.  Place your glycerol/cell culture mixture into the -80 C freezer"
end

release [cell_culture_tube[0], glycerol[0]]
#release concat(falcon_tube, plate)
