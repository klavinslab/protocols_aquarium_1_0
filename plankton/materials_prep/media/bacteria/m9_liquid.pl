information "Prepare an 400 mL bottle of M9 Minimal Media with options for carbon source and biotin."
# Inputs without protocols:
#   5X M9 Salts @ 160 mL
#   100X MgSO4 CaCl2 @ 8 mL
#   Sterile CAS amino acid solution @ 3.2 mL
#   4% Sterile Filtered Cellobiose @ 80 mL
#   20% Sterile Filtered Glucose


argument
  glucose_percent: number, "The percentage of glucose in the final product. If 0, none will be added. The standard is 2."
  cellobiose_percent: number, "The percentage of cellobiose in the final product. If 0, none will be added."
  biotin: string, "Add biotin? (Yes or No)."
end


take
  bottle = 1 "500 mL Bottle"
  salts = 1 "5X Difco M9 Salts Solution"
  saltsol = 1 "100X MgSO4 CaCl2"  # TODO: When preparing this, add CaCl2 first
  water = 1 "DI Water, Sterile"
end


# TODO: Input checking a la SDO liquid protocol
step
  description: "Add M9 salts"
  note: "Using a serological pipette and 25 mL tip, add 80 mL of 5X M9 salts to the bottle. To conserve tips, use the same one repeatedly, adding 30 mL 2 times, then finally 20 mL."
  warning: "Sterile technique is very important for this step."
end


step
  description: "Add 100X MgSO4 CaCl2 solution"
	note: "Using a serological pipette, add 4 mL of 100x MgSO4 CaCl2 solution."
end


if biotin == "Yes"
  take
    biotin_aliquot = 1 "250X Biotin"
  end
  step
    description: "Add biotin"
    note: "Using a 1000 µL pipette, add 1.6 mL of 250x biotin."
  end
  release biotin_aliquot
end


if cellobiose_percent != 0
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


if glucose_percent != 0
  take
    dextrose = 1 "20%% Dextrose Solution (sterile)"
  end
  # c1v1 = c2v2 -> v1 = c2v2/c1
  glucose_volume = (glucose_percent / 100.0) * 400.0 / 20.0
  step
    description: "Add dextrose"
		note: "Using the serological pipette, add %{glucose_volume} mL of 20%% Dextrose."
  end
  release dextrose
end


step
  description: "Add water"
  note: "Fill to the 400 mL line with sterile water."
end


release [salts[0], saltsol[0], water[0]]


product_label_prefix = "400 mL M9 liquid"
if cellobiose != 0 && glucose == 0
  product_label_suffix = " Cellobiose"
elsif glucose != 0 && cellobiose == 0
  product_label_suffix = " Glucose"
else
  product_label_suffix = " Cellobiose + Glucose"
end


additions = ""
if biotin == "Yes"
  additions = additions + " +biotin"
end


product_label = product_label_prefix + product_labe_suffix + additions


produce
  m9 = 1 product_label
  release bottle
end
