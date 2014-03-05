information "Prepare a 100X (for M9 Media) solution of MgSO4 and CaCl2"


take
  tube = 1 "50 mL Falcon Tube"
  mgso4 = 1 "1 M MgSO4"
  cacl2 = 1 "1 M CaCl2"
end


step
  description: "Add 25 mL of dI water to falcon tube"
  note: "Fill the falcon tube up to the 25 mL mark with deionized water from jug J1 at B15.530. Discard any excess into the sink."
end


step
  description: "Add 2.5 µL of 1 M CaCl2"
  note: "Using a 10 µL pipettor, add 2.5 µL of 1 M CaCl2."
end


step
  description: "Add 25 µL of 1 M MgSO4"
  note: "Using a 100 µL pipettor, add 25 µL of 1 M MgSO4."
end


include "plankton/includes/materials_prep/filter_sterilize_syringe.pl"_
  volume: 25
  name: "the MgSO4 CaCl2 solution"
end


produce
  m9_salts = 1 "MgSO4 CaCl2 Solution (sterile)"
  release tube
  note: "Write Difco M9 Minimal Salts, 5x (unsterile) and the date on the label in addition to the id number."
end


release [mgso4[0], cacl2[0]]
