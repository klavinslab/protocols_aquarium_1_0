information "Prepare a 20%% (g / mL) filter-sterilized solution of 2-deoxy-D-galactose (DOG)"


take
  tube = 1 "50 mL Falcon Tube"
  dog = 1 "2-Deoxy-D-galactose"
end


percentage = 20
ml = 5


step
  description: "Transfer the full 1g of deoxy-galactose to the falcon tube."
  note: "Open the cap and dump the contents of the 1g container into the falcon tube."
end

step
  description: "Get the remaining powder out of the container."
  note: "Using the P-1000, aspirate 1ml of distilled or molecular grade water (B15.530) and dispense into the empty deoxy-galactose bottle.  Mix gently and then transfer the liquid to the falcon tube.  Thow out the empty deoxy-galactose bottle when you're done."
end

step
  description: "Fill falcon tube to %{ml} mL mark with dI water."
  note: "Fill the falcon tube up to the %{ml} mL mark with deionized water from jug J1 at B15.530."
end


include "includes/materials_prep/filter_sterilize_syringe.pl"
  volume: ml
  name: "the DOG solution"
end


produce
  dextrose_solution = 1 "DOG Solution, 20%% (sterile)"
  release tube
  release dog
  location: "B5.470"
  note: "Write 20%% DOG Solution (sterile) and the date on the label in addition to the id number."
end


