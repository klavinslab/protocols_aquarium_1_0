information "Prepare a 5X solution of M9 Salts."


take
  bottle = 1 "1 L Bottle"
  salts = 1 "Difco M9 Minimal Salts, 5x"
end


include "plankton/includes/materials_prep/add_dry_reagent.pl"
  container: "each bottle"
  reagent: "M9 Minimal Salts"
  grams: 45.12  # 56.4 g / L
end


step
  description: "Fill with dI Water to 800 mL"
  note: "Fill the bottle up to the 800 mL mark with deionized water from jug J1 at B15.530."
end


produce
  m9_salts = 1 "Difco M9 Minimal Salts Solution, 5X (unsterile)"
  release bottle
  note: "Write Difco M9 Minimal Salts Solution, 5X (unsterile) and the date on the label in addition to the id number. Place the bottle in the autoclave staging area - B1.320."
  location: "B1.320"
end


release salts
