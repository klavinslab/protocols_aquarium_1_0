information: "Prepare an 800 mL bottle of M9 Minimal Media with options for carbon source, biotin, and CAS amino acids."


argument
  nutrient: string, "The carbon nutrient used in this batch of M9 (glucose or cellobiose)."
  biotion: string, "Add biotin? (Yes or No)."
  casaa: string, "Add CAS amino acids? (Yes or No)."
end


volume = 800


take
  bottle = 1 "1000 mL Bottle"
  salts = 1 "5X M9 Salts"
  saltsol = "100X MgS04 CaCl2"  # TODO: When preparing this, add CaCl2 first
  water = "DI Water, Sterile)"
end


# TODO: Input checking a la SDO liquid protocol
if biotin == "Yes"
  take
    biotin_aliquot = 1 "250X Biotin"
  end
end


if casaa == "Yes"
  take
    casaa_aliquot = 1 "Sterile CAS amino acid solution"
  end
end


if nutrient == "cellobiose"
  take
    cb = "4% Sterile Filtered Cellobiose"
  end
elsif nutrient == "glucose"
  take
    gluc = "20% Sterile Filtered Glucose"
  end
end


m9vol = volume / 5.0


step
  description: "Add M9 salts"
  note: "Using a serological pipette and 25 mL tip, add %{m9vol} mL of 5x M9 salts to the bottle."
end


mgcavol = volume / 100.0


step
  description: "Add 100X MgSO4 CaCl2 solution"
	note: "Using the serological pipette or P1000 pipette (depending on how much you're adding), add %{mgcavol} mL of 100x MgSO4 CaCl2 solution."
end


if biotin == "Yes"
  biovol = volume / 250.0
  step
    description: "Add biotin"
    note: "Using the P1000 pipette, add %{biovol} mL of 250x biotin."
  end
end


if nutrient == "cellobiose"
  cbvol = volume / 10.0
  step
    description: "Add cellobiose"
    note: "Using the serological pipette, add %{cbvol} mL of 4%% cellobiose."
  end
end


if nutrient == "glucose"
  gluvol = volume / 50.0
  step
    description: "Add glucose"
		note: "Using the serological pipette, add %{gluvol} mL of 20%% glucose."
  end
end


step
  description: "Add water"
  note: "Fill to the %{volume} mL line with sterile water."
end


release [salts[0], saltsol[0], water[0]]


if biotin == "Yes"
  release biotin_aliquot
end


if casaa == "Yes"
  release casaa_aliquot
end


if cellobiose == "Yes"
  release cb
end


if glucose == "Yes"
  release glucose
end


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
