information "Prepare an 400 mL bottle of M9 Minimal Media with options for carbon source and biotin."
# Inputs without protocols:
#   5X M9 Salts @ 160 mL
#   100X MgSO4 CaCl2 @ 8 mL
#   Sterile CAS amino acid solution @ 3.2 mL
#   4% Sterile Filtered Cellobiose @ 80 mL
#   20% Sterile Filtered Glucose

take
  bottle = 1 "500 mL Bottle"
  salts = 1 "800 mL Difco M9 Minimal Salts Solution, 5X (unsterile)"
  saltsol = 1 "100X MgSO4 CaCl2"  # TODO: When preparing this, add CaCl2 first
  water = 1 "DI Water, Sterile"
end


# TODO: Input checking a la SDO liquid protocol
step
  description: "Add M9 salts"
  note: "Using a serological pipette and 25 mL tip, add 80 mL of 5X M9 salts to the bottle. To conserve tips, use the same one repeatedly, adding 30 mL 2 times, then finally 20 mL."
  warning: "Sterile technique is very important for this step."
end


release [salts[0], saltsol[0], water[0]]


produce
  m9 = 1 product_label
  release bottle
end
