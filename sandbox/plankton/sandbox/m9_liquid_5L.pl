information "Prepare sterile 5L carboy of M9 Media (minimal media for bacteria)."
# biotin filter sterilized
# 1M mgso4 and cacl2 are mixed together in large volume of water (25 mL), then filter sterilized
# Nutrients are all filter sterilized
# Autoclaved DI water added directly to M9

product_name = "5L Carboy M9 Liquid"

argument
  caa: number, "Enter the percent of casamino acids (typically 0, or 0.05)"
  glycerol: number, "Enter the percent glycerol desired (typically 0, or 0.1)"
  lactose: number, "enter the precent lactose desired (typically 0, or 0.18 =5mM)"
  glucose: number, "Enter the percent glucose desired (typically 0.5)"
end

#TODO: make sure these names are good.
take
  bottles = 1 "5 L Carboy"  #exists
  temp_bot = 1 "5 L Bottle"
  filter = 1 "1 L Bottle Top Filter" #exists
  m9_powder = 1 "M9 Minimal Salts, 5x" #exists
end

if glycerol > 0
  take
    gly = 1 "50 percent Glycerol (sterile)" #exists
  end
end

if lactose > 0
  take
    lac = 1 "Lactose" #exists
  end
end

if caa > 0
  take
    casAA = 1 "Bacto Casamino Acids" #exists
  end
end

if glucose > 0
  take
    glu = 1  "Dextrose" #exists
  end
end

take
  mgso4_stock = 1 "MgSO4 1M stock solution"
  cacl2_stock = 1 "CaCl2 1M stock solution"
end

step
  description: "Remove foil from air filter"
  note: "Remove foil from air filter on the carboy.
  	 Gently screw the filter clockwise to ensure it is still tight.
  	 Set the caryboy asside."
end

step
  description: "Add deionized water"
  note: "Using a graduated cylinder or 1L bottle, add 3 L DI water to the 5L bottle"
end

step
  description: "Add 500 uL CaCl2 1M Stock solution"
  note: "Using the P1000 pipette 500 uL CaCl2 stock solution into the 5L bottle"
end

step
  description: "Add 5 mL MgSO4 1M Stock solution"
  note: "Using the serological pipette 5 mL MgSO4 stock solution into the 5L bottle"
end

step
  description: "Clean the spatuala"
  note: "Use 70 percent ethanol and a kimwipe to wipe off the spatula."
end

step
  description: "Add Diffco M9 Salts"
  note: "Place a large weigh boat on the scale.
         Zero the scale.
         Using a spatula, add 56.4g of the Difco M9 salts to the boat.
         Pour into 5L bottle using a corner of the weigh boat.
         Lightly flick to dislodge remainder of the powder."
  warning: "Use the 5L bottle not the carboy for this step."
  image: "pouring_dry_reagent_into_1_L_bottle"
end

if glycerol > 0
  vol = 5000*glycerol/100*2
  step
    description: "Add %{vol} mL 50%% glycerol"
  end
end

if lactose > 0
  wgt = 5000*lactose/100
  step
    description: "Add %{wgt} g lactose"
  end
end

if caa > 0
  wgt = 5000*caa/100
  step
    description: "Add %{wgt} g Casamino acids"
  end
end

if glucose > 0
  wgt = 5000*glucose/100
  step
    description: "Add %{wgt} g glucose"
  end
end

step
  description: "Cap and mix."
  note: "Tightly close the cap(s) on bottle(s) and shake (each) until all contents are dissolved.
         To check for dissolution, let bottle rest for 10 seconds, and then pick up and look for sediment on the bottom.
         This should take approximately 20 seconds."
end

produce
  produced_bottles = 1 product_name
  release bottles
  note: "Write %{product_name} on the label in additon to the above id number.
         The standard location for M9 is xxxx"
end

release mgso4_stock
release cacl2_stock
release temp_bot
release filter
release m9_powder

if glycerol > 0
  release gly
end

if lactose > 0
  release lac
end

if caa > 0
  release casAA
end

if glucose > 0
  release glu
end
