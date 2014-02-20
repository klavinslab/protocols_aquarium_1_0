argument
  antibiotic_array: sample array, "The antibiotics to add to the glucose solution"
end

step
  description: 
    "This protocol prepares the glucose media and aTc inducer solutions." 
end

take
  #kan
  #kan = 1 "200X 1 mL Kanamycin Aliquot"
  #glucose
  gluc = 1 "400 mL M9 liquid Glucose"  #check that this is the right concentration
  #amp
  #amp = 1 "100X 1 mL Ampicillin Aliquot"
  #50mL tube
  media_tube = 1 "50 mL Falcon Tube"
  #aTc
  #atc = 1 "??"
  #MG water
  #MG_water = 1 "
  #1.5mL Tube
  #atc_tube = 1 "
end

 
step
  description: "Prepare the glucose media with kan and amp."
  note: "
  check: "Add 15 mL of 0.4%% Glucose M9 Media to the 50mL tube"
  check: "Add 75 uL of Kanamycin to the 50mL tube"
  check: "Add 30 uL of Ampicillin to the 50mL tube"
  check: "Vortex the tube to mix"
end

produce
  s = 1 "<<Glucose Media with Amp and Kan>>" from media_tube[] #todo: get correct item id
  location: "Bench"
end

step
  description: "Prepare the aTc inducer"
  check: "Add <<1?>> mL of MG water to a 1.5mL tube"
  check: "Add <<X>> mL of aTc stock to the 1.5mL tube"
  check: "Vortex to mix"
end

produce
  t = 1 "<<aTc Inducer Tube>>" from atc_tube[]
  location: "Freezer?"  #todo: determine whether aTc must be refridgerated
end

release concat(kan, gluc, amp, atc, MG_water)  #todo: I think this is the wrong syntax.  Fix if borken.

log
  return: { glucose_media: s[:id], aTc_inducer: t[:id]}
end
