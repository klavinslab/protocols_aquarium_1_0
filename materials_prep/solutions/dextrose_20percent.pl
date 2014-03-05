information "Prepare a 20%% (g / mL) filter-sterilized solution of Dextrose (glucose)"


take
  tube = 1 "50 mL Falcon Tube"
  glucose = 1 "Dextrose"
end


percentage = 20
ml = 30


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "the falcon tube"
  reagent: "Dextrose"
  grams: (percentage / 100) * ml
end


step
  description: "Fill falcon tube to %{ml} mL mark with dI water."
  note: "Fill the falcon tube up to the %{ml} mL mark with deionized water from jug J1 at B15.530."
end


include "plankton/includes/materials_prep/filter_sterilize_syringe.pl"
  volume: ml
  name: "the dextrose solution"
end


produce
  dextrose_solution = 1 "20%% Dextrose Solution (sterile)"
  release tube
  note: "Write 20%% Dextrose Solution (sterile) and the date on the label in addition to the id number."
end


release glucose
