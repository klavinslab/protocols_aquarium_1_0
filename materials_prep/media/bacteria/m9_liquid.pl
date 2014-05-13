information "Prepare a 1 L bottle of M9 Minimal Media with options for carbon source and biotin."
# Inputs without protocols:
#   5X M9 Salts @ 160 mL
#   100X MgSO4 CaCl2 @ 8 mL
#   Sterile CAS amino acid solution @ 3.2 mL
#   4% Sterile Filtered Cellobiose @ 80 mL
#   20% Sterile Filtered Glucose


argument
  w: sample, "the sterile water made in the last step"
  glucose_percent: number, "The percentage of glucose in the final product. If 0, none will be added. The standard is 2."
  cellobiose_percent: number, "The percentage of cellobiose in the final product. If 0, none will be added."
  biotin: string, "Add biotin? (Yes or No)."
end

label = "1L M9"
if cellobiose_percent > 0 
  label = label + "-Cellobiose"
end
if glucose_percent > 0 
  label = label + "-Glucose"
end
if biotin == "Yes"
  label = label + "-biotin"
end


take
  water = item w
  note: "Retrieve the autoclaved 'M9 salts' and 'sterile water'"
end

step
  description: "Let water and M9 salts cool"
  note: "Press next once the water and M9 salts have cooled below 50 C (not painful to hold)"
  note: "While you wait, relabel the bottle labeled 'M9 salts' to '%{label}'"
end

take
  saltsol = 1 "100X MgSO4 CaCl2"  
end

# TODO: Input checking a la SDO liquid protocol

step
  description: "Add 100X MgSO4 CaCl2 solution"
	note: "Using a serological pipette, add 4 mL of 100x MgSO4 CaCl2 solution."
end


if biotin == "Yes"
  take
    biotin_aliquot = 1 "100X Biotin"
  end
  step
    description: "Add biotin"
    note: "Using a the serological pipette, add 10 mL of 100x biotin."
  end
  release biotin_aliquot
end


if cellobiose_percent > 0
  take
    cb = 1 "4%% Sterile Filtered Cellobiose"
  end
  # c1v1 = c2v2 -> v1 = c2v2/c1
  cellobiose_volume = (cellobiose_percent / 100.0) * 400.0 / 4.0
  step
    description: "Add cellobiose"
    note: "Using the serological pipette, add %{cellobiose_volume} mL of 4%% cellobiose."
  end
  release cb
end


if glucose_percent > 0
  take
    dextrose = 1 "20%% Dextrose Solution (sterile)"
  end
  glucose_volume = (glucose_percent / 100.0) * 1000.0 / 20.0
  step
    description: "Add dextrose"
		note: "Using the serological pipette, add %{glucose_volume} mL of 20%% Dextrose."
  end
  release dextrose
end


step
  description: "Add water"
  note: "Fill to the 1 L line with sterile water."
end


produce
  m9 = 1 label
  data
    glucosePct: glucose_percent
    cellobiosPct: cellobiose_percent
    biotin: biotin
  end
  release [saltsol[0],water[0]] 
end


step
  description "Put the away the water bottle"
  note: "empty the remaining sterile water down the sink, remove any labels, and place on the bottle drying rack"
end

