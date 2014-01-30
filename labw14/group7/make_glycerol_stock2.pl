argument
 Transformed_E_coli_Strain_id: sample, "An overnight suspension of transformed E. Coli cells (in culture tube)"
end

step
 description: "This prodocol decribes the method for preparing cells for long-term storage in glycerol stock."
end

take
  cell_culture_tube = item Transformed_E_coli_Strain_id
  glycerol = 1 "50 percent Glycerol (sterile)"
  sterile_tube = 1 "1.5mL sterile tube"
  sample_holder = 1 "1.5mL tube holding tray"
end

step
 description: "Label your 1.5mL steile tube with the sample ID number, as well as your initial and todays date (mm/dd/yyyy).  This sample will potentially be kept in the freexer for many months, so be sure to label both the cap and the side of the tube foe redundancy."
end

step
 description: "Add 900uL glycerol stock, then 900uL cell culture to the 1.5mL sterile tube"
 note: "Be sure to use STERILE technique while handling the gylcerol stock.  If you contaminate this stock it wil ruin everyone else's experients! This means: loosen caps before loading the pipette tip, and do not touch the inside of the jar with the micropipetter"
end

step
 description: "Vortex the 1.5mL sterile tube for 20sec on high"
end

produce
 s = 1 “Transformed E coli Glycerol Stock” from cell_culture_tube[0]
 release sterile_tube
 note: "Place your glycerol/cell culture mixture into the -80 C freezer"
 location:"M80.0.xx"
end

release [falcon_tube[0], plate[0]]
#release concat(falcon_tube, plate)
