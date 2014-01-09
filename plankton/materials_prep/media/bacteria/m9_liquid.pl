information: "Prepare an 800 mL bottle of M9 Minimal Media with options for carbon source, biotin, and CAS amino acids."
# Inputs without protocols:
#   5X M9 Salts @ 160 mL
#   100X MgSO4 CaCl2 @ 8 mL
#   Sterile CAS amino acid solution @ 3.2 mL
#   4% Sterile Filtered Cellobiose @ 80 mL
#   20% Sterile Filtered Glucose


argument
  nutrient: string, "The carbon nutrient used in this batch of M9 (glucose or cellobiose)."
  biotion: string, "Add biotin? (Yes or No)."
  casaa: string, "Add CAS amino acids? (Yes or No)."
end


take
  bottle = 1 "1000 mL Bottle"
  salts = 1 "5X M9 Salts"
  saltsol = "100X MgSO4 CaCl2"  # TODO: When preparing this, add CaCl2 first
  water = "DI Water, Sterile)"
end


# TODO: Input checking a la SDO liquid protocol
# FIXME: PDL version didn't have a CAS amino acid addition step!
#if casaa == "Yes"
#  take
#    casaa_aliquot = 1 "Sterile CAS amino acid solution"
#  end
#end


step
  description: "Add M9 salts"
  note: "Using a serological pipette and 25 mL tip, add 160 mL of 5x M9 salts to the bottle. To conserve tips, use the same one repeatedly, adding 30 mL 5 times, then finally 10 mL."
  warning: "Sterile technique is very important for this step."
end


step
  description: "Add 100X MgSO4 CaCl2 solution"
	note: "Using the serological pipette or 1000 µL pipette (depending on how much you're adding), add 8 mL of 100x MgSO4 CaCl2 solution."
end


if biotin == "Yes"
  take
    biotin_aliquot = 1 "250X Biotin"
  end
  step
    description: "Add biotin"
    note: "Using a 1000 µL pipette, add 3.2 mL of 250x biotin."
  end
  release biotin_aliquot
end


if nutrient == "cellobiose"
  take
    cb = "4% Sterile Filtered Cellobiose"
  end
  step
    description: "Add cellobiose"
    note: "Using the serological pipette, add 80 mL of 4%% cellobiose."
  end
  release cb
end


if nutrient == "glucose"
  take
    gluc = "20% Sterile Filtered Glucose"
  end
  step
    description: "Add glucose"
		note: "Using the serological pipette, add 80 mL of 20%% glucose."
  end
  release gluc
end


step
  description: "Add water"
  note: "Fill to the 800 mL line with sterile water."
end


release [salts[0], saltsol[0], water[0]]


# FIXME: Figure out the object types vs. data fields for biotin / casaa options
if nutrient == "cellobiose"
  produce
    m9 = 1 "M9 Media Cellobiose"
    release bottle
  end
elsif nutrient == "glucose"
  produce
    m9 = 1 "M9 Media Glucose"
    release bottle
  end
end
